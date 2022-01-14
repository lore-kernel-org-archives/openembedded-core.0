Return-Path: <paul.barker@sancloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A53C433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 13:22:17 +0000 (UTC)
Received: from GBR01-CWL-obe.outbound.protection.outlook.com
 (GBR01-CWL-obe.outbound.protection.outlook.com [40.107.11.133])
 by mx.groups.io with SMTP id smtpd.web10.6830.1642166536235424157
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 05:22:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@sancloud.onmicrosoft.com
 header.s=selector2-sancloud-onmicrosoft-com header.b=eGuMeooA;
 spf=pass (domain: sancloud.com, ip: 40.107.11.133,
 mailfrom: paul.barker@sancloud.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GmXVzvx5+f0zp4HkobyJHHAhCg2aaPxpTLecUXTeTr8UgvLmA1KPRtLSCgiERuzDPRbi1l6ROdwg9W0YsZdNpEtszA05lTmzs1K9hWnRAk5X8P/0TmWU1ofKrqMAHqMiKoRsHdacdNBI8LA83rEJ+3P0SxQZRCQnn45Vmbwhw8fPxQYN7iONzlcCA/txwmNJtT43IuVnTF3+YcEYioSgEKFp+Dv8PGyL/2mDaP+lhgUf0sARHB6KzUiR3EFT4IcLhCLNVOwxcgSPiPE9S7k4v9sJ1Fm5D50+hy2xM0Nn9o+/XisSvUujA9kyznbuSjEvNdrNszQH7CjqG6ojvrMMvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTmUjCpgx5/tIA9TA3bGTmZ29TDxgkULWbQ+BgdLT48=;
 b=k71mq2ngcik7RydTzn+LbpastqI0vnIBGVixqb7Kxt60dfrypNzI1xsrqtTSti5GIm1M+5t75D6SpyTtcAThEJtDL1yRKHu21GIKhRWkbIoTWk3spvyjFyLpA70Lmw+NSBFdymk9nTRh4XNK9w+BQtzjQnMGU6YktasIGop/6OjM+rIqvHmUguPLtHOTH4G8IUCN5DY5HK9uUHmH812neVMS9EXJyxxDxZnyIWCK3EpWS9tQY8cxbcHyXL2Nm/xTjMnijnYBFbmRaeqvvlucf3V7wAIji7CgdHmdr6MYbhZ2wQ3E1i6c4Vn51LpCDwaTihv64uCnnITBHHqLP1eveA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTmUjCpgx5/tIA9TA3bGTmZ29TDxgkULWbQ+BgdLT48=;
 b=eGuMeooAYPgFPlP7BQUmfBLICKmxveLk5LObjQFEIDxX3N5XLh4iontUPCaL29U99r3axZ1DTvut2BnKwkldFIp4NEcVJgUgAUIu/a+Rxw/6RpnuhcovsNLcHlS2Z3l5rgZQG6hVUBhURbTs0m9PYgmJrfefZ32jmG+sEuD6JkE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by LO4P123MB5382.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1fd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Fri, 14 Jan
 2022 13:22:13 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::4ce0:d9e3:cb2f:7992]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::4ce0:d9e3:cb2f:7992%5]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 13:22:13 +0000
From: Paul Barker <paul.barker@sancloud.com>
To: openembedded-core@lists.openembedded.org,
	Anuj Mittal <anuj.mittal@intel.com>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Paul Barker <paul.barker@sancloud.com>
Subject: [honister PATCH] kernel: introduce python3-dtschema-wrapper
Date: Fri, 14 Jan 2022 13:21:50 +0000
Message-ID: <20220114132150.2604-1-paul.barker@sancloud.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0125.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::22) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3252761-506c-41bd-504b-08d9d760e061
X-MS-TrafficTypeDiagnostic: LO4P123MB5382:EE_
X-Microsoft-Antispam-PRVS: 
	<LO4P123MB5382D38C150AD751ADC6E6CA93549@LO4P123MB5382.GBRP123.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	24uT8RZODohpObYYu3BZ3RHc/qVxtpQHttDWaJGfRqxd8qBDrdoepKPcUEmmQM2rZWWFD8Yrkna4+SomOk/wE3bSwF+0U7aRtNgrbvsWPvBtL9zK8acI9CTQn8rYgYTSK2EtvAVX+UsoIKj+kiiT6toXquuJLkKZmZMveKAEvdWwHaT9tMmv2csvB2f+ytG1qxLj0mSGzQtPyxil8BxjLqtTBhF4K/LRVPzOAZCqz2BPd2Y/FmyfhBcSNCdt11rpzKYd2EvhUurS6GzW1JIRGQpkQcEYJ0zMZVINHdrim5lD34PwKfnb9KVGyO6uVZQ1tJpBrbGdNCy6R3kFBGZqDY0bDkBrkEak89+1bfX05PXn5wWud0vmpb7ZPgC/KYGyKhw9dmvqGI7SjU1FZ/T0Bj5Rdiau5aVYIavRcGagKM3oxqF8Q0VJx0Pe8ayyUh5FnXaLffsxyLSYYqNIlzdZJIialFXKM02uBclVg4QopSE1nXWUX/5ON3v3T4kgS9tgp+pR+k0gCCsyC+5WS0uO4uNkJLcih1eZRfUiDmQN1uYCOoFchN+O1HuWVsoidLxOkAIknOlI9CuHBzNa03cR2s//k7IHlrnz7EBgciwbIly6sK2hNpGFbv2e3XEw6fhfKWGYwkUJiRREyy1KGHfW4k3lEn0keqAeOfbqptT/BzEJTBU8QJn2G4kerZYx3T5uYKYwNcoRpLK85jlSUp0EltdJ9E9ZxynjwQQbtkVvaUr53yFIg43FUwQVDbNaHFEY7MUGej7+/fs0uwW+GrIIB6TB90hl/wj/J8EYHEQVGR0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(346002)(376002)(396003)(136003)(39830400003)(366004)(66556008)(52116002)(6916009)(54906003)(107886003)(6506007)(2616005)(26005)(8676002)(44832011)(8936002)(508600001)(66946007)(66476007)(316002)(186003)(6486002)(6666004)(1076003)(86362001)(6512007)(38100700002)(2906002)(4326008)(38350700002)(83380400001)(5660300002)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3JMrcIxudJdZ5SKHkj19Fqm3NEEygpgzsubAri6hMVKa4N9e/l/94GS27z31?=
 =?us-ascii?Q?1cxC0bzZK+fnqcVcVFkH2Gx6X072JdnuZBrd0a3+bAdNn4PdlV8zX3eF1Me8?=
 =?us-ascii?Q?oxuGhrz3myZa5/k/o8JN8z1F6wkdXdn4Fd7blwG0xOQLyhHkOx9QwDQ+2QK4?=
 =?us-ascii?Q?5pThzRiKE41DUdev0Mp1OsoqINCaFfl1m0Wh7K9uz5xQeeehpphsJ3dVDIC+?=
 =?us-ascii?Q?/yqxuWd27quLwR0//64LcmeuBJNvSOisIuC+7xL8lkTR0AzhCYlXmT2RYph6?=
 =?us-ascii?Q?t54daZ95xyGB0fouWjQWIx5aDUD9GJ5KXHw7odl9gxmO/A5NB5uFVhm8skfV?=
 =?us-ascii?Q?xx2mLzeCgr0e4rPEbuRYQvasSfxTKfty1iCkkaeNU/k7Z7SUduB5/TmTUTSb?=
 =?us-ascii?Q?Npur3Vcfm+VC1XrZe6rF27j3DsDhKx11xBlOWchxrrBrYkT74+RkLsFk86HE?=
 =?us-ascii?Q?L0MUxQ5MQ1rJe4WaKZKHcCkCVVMbNEh1Il+pDSgBVg3T4LJiyr0dIXaIiC0S?=
 =?us-ascii?Q?+sXtNv8f6Xohaw0fTYSgFzblAe57y2p7obKtMGdwbj0HqLac5XeVCbg+YWF2?=
 =?us-ascii?Q?qEcg8DFk+cAfDdGIzNb0AG5u2YsTNBkxq5UucD240NyFb2l5LXzHHVvGpSIz?=
 =?us-ascii?Q?bQADvGIpRRTpQ2zfoQ7oNhiqBRHIyoV8vCJE1mMinZc9/CTj5mpJdREVcQvr?=
 =?us-ascii?Q?rW69zgfleP035z40UUMju03PseL73ouKn609Ng3bGlx/jsPHIRLXHcHQ5xhV?=
 =?us-ascii?Q?iAx7YIy1zwCC8BK6jkRir8qZFhhqD/DC/GNfqpjEpOgsQzfXPWbrLNQAjT1q?=
 =?us-ascii?Q?oJTQzRUUeIopHv48ETqsKHVKklD072GG6NTqAwv4/h9e54O6S0uffLofDv0E?=
 =?us-ascii?Q?xrqRRGnY5ujgMbDIgfpUtoRCyrDG9UVMuWQ2kXCuLYbbTlPi0n2kCDmNFDVJ?=
 =?us-ascii?Q?rsHFtlSlGfitTWIUbA/TiTlJKsTdP/RyKT1IltZh18wIN/iVVr9dZaaNhl2H?=
 =?us-ascii?Q?kqJufs3rkytNR2oquZahTR1TFumkxz/yNhqg/UWD6Ic6UCsserUa81/FbM5G?=
 =?us-ascii?Q?NbI/rU0oMgrOqO/vhvGO759dA2T1yRdWEmKR46/4qwvawAP7tMIiRm8iqP6r?=
 =?us-ascii?Q?6tLu1smf5iAmCtifLjbEvuA87RfW4nCB4UFdhhVe1XMZcl7RQf2+NOiZP45W?=
 =?us-ascii?Q?4In1pHqnsp3LiD29c4DFfTIEsiSiUz04u0hO8xI0+Nyjz75Hb+i6RwYwtNYz?=
 =?us-ascii?Q?ZIi8clEBimBVnHOogjYJyASLqYzsCwVQ9MpDhN+TcBK9r7JX33T4xDZukdSH?=
 =?us-ascii?Q?3k7XjgYon0THRMacyYGsa9XqfD8wa5ShzXGd+8kMTLNSRA6dwvLhp4YMPbu+?=
 =?us-ascii?Q?p1WgTtgQhDA1wwXzW3LXM7vqiazoADooiMc0AssVuKJqoZCaWfR39lPza/Wh?=
 =?us-ascii?Q?qUZGiLjly+YvZITxGY5T0d4PKBjw0AUI8+XC4hsRYCIP09ItEFiuI944mcHu?=
 =?us-ascii?Q?LhAcU/SlRuUDuIA1roAhWQjet0Lx4u6xcKShFoxqxlar/5KLC6nPekKgG39u?=
 =?us-ascii?Q?LgDDsnZMGhIub1nPII7OOzrao5099XctkpsqJB+10I2Lab3MUPKedsS6X2gZ?=
 =?us-ascii?Q?I1s9lU25+LjgAdW17gWj+oz5wLUaLBi3fCkmRMuTEsOIfr8VTmFDboklsjUy?=
 =?us-ascii?Q?evSb0w=3D=3D?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b3252761-506c-41bd-504b-08d9d760e061
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 13:22:13.2191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 DaNlQCSo/F2hxVvNPYzyZZxYee72BlPTBOeRHxFjLUyIh+s1JlKgVzes/WBeWdj92DY3CsV+mJhJ1Vyw7mDGqoc34/4zwU6Ua5E0FCNPgmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P123MB5382
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 13:22:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160566

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
index b3b7711a0c48..2b54d2d12f9b 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -592,6 +592,7 @@ RECIPE_MAINTAINER:pn-python3-cython =3D "Oleksandr Krav=
chuk <open.source@oleksandr
 RECIPE_MAINTAINER:pn-python3-dbus =3D "Zang Ruochen <zangrc.fnst@fujitsu.c=
om>"
 RECIPE_MAINTAINER:pn-python3-dbusmock =3D "Oleksandr Kravchuk <open.source=
@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-docutils =3D "Oleksandr Kravchuk <open.source=
@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER:pn-python3-dtschema-wrapper =3D "Bruce Ashfield <bruce.a=
shfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pycryptodome =3D "Joshua Watt <JPEWhacker@gma=
il.com>"
 RECIPE_MAINTAINER:pn-python3-pycryptodomex =3D "Joshua Watt <JPEWhacker@gm=
ail.com>"
 RECIPE_MAINTAINER:pn-python3-extras =3D "Oleksandr Kravchuk <open.source@o=
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


