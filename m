Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4A4C83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 06:55:45 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.34])
 by mx.groups.io with SMTP id smtpd.web11.1751.1752562543721235484
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 23:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=AhmjH9DF;
 spf=pass (domain: de.bosch.com, ip: 52.101.71.34, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oftm1n70hMRNIXHp1x54zVkAx08qqPxey31Iu8F7Z9EiFBBRb53vEM0LrqYZMmlF9c99H/iEDMVWuOBBwRVdiqG3LEIxNNq+VKgoi9PXLKpVUEu3NUIB4V0b77FLoabkBhvoPnqixDe8cW5RL4zUKsHFtJDGaDDnydhqJKR5z2xj0O1acZcOdZ82O1ijpNU40I5H/OOL2Imq5gUOmpd4qxA0/TXz/X1CK5mJI3QXVj1Yc+9NE3XlBBTd5ROKGtlx2TeZy9vnmOeozJqhnpVp2l7WhiEw9OW/D5Hg2Paf41ceTcRtdb0vrv3WhNU8fryB9sVWHQvp0ksI/2JtxLg2cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iEFl7p7wGixEz5Ox39tFSmMVT4JZhWYuI3ZxVROhbQ=;
 b=qJnM1nhCxDUDHqP5bFTpEbYR8M+R+pDR9H6YYnZyHngmYT4Oh8+RB4JLqARswSk75JV/6iGLF517ptKNJz/rXrNV+pHmVkB6AJMGJPPSHkrhqqK7bHd2XiQ3hUEkI3eOh4nUUk51zJ5/Ze8UOvGblSQ6k3uNxOWoV07KRFO9qdMRY3DNC5oNqxaeMbpJDdkWIYRLVwzFXXjQ0PWqc5UN+th/5kevlAiwKdMZR5eaBDaMP+3B9a/hdFi6wGnPR6uEsdEfCu61kbuG4KeuvTwL1OMH/OyFsVEMBHrqiqiwMXpDsxVDniMc7U3zFsV2uu2+svQQzWAIj4PWS5jFIysCOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iEFl7p7wGixEz5Ox39tFSmMVT4JZhWYuI3ZxVROhbQ=;
 b=AhmjH9DFKevS6WVPfA2qbgli9Qo5CqRN8JKTLKRuhjVkO7pof4hGgWPgRiC4jEODm7mDRVjlDRQZGNjTqWj5qDjW6eZVj9Eaz55z2UYaF40Q3NN6yWPW5TfcMOLbKnbt5UtjdKFUAo32OKJbmvKFUBuzL9WvCeooMBQwLyhDw+nBWhQzHdKzosgVfobAkvQ/ES/Ip4/4cR2jSOVuMcdirxDBQwV/5iTaM10+oKzLeRLKG0Rvw9dpBc449o0BcbnRX3rJx4rhwH/8Tl6zAmdDhWRwpbZeSVtDTNP+uLFMJpFqGBnnVCs99YjP6YZrkXrzwQ8j4p7aMofK/Ta8hI3Fqg==
Received: from DB8PR06CA0046.eurprd06.prod.outlook.com (2603:10a6:10:120::20)
 by AM7PR10MB3480.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:132::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 06:55:39 +0000
Received: from DU2PEPF00028D01.eurprd03.prod.outlook.com
 (2603:10a6:10:120:cafe::f8) by DB8PR06CA0046.outlook.office365.com
 (2603:10a6:10:120::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Tue,
 15 Jul 2025 06:55:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DU2PEPF00028D01.mail.protection.outlook.com (10.167.242.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Tue, 15 Jul 2025 06:55:38 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Tue, 15 Jul
 2025 08:55:35 +0200
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Tue, 15 Jul 2025 08:55:35 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.142.124.32) by
 smtp.app.bosch.com (10.124.11.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 08:55:35 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-core@lists.openembedded.org>
CC: <jpewhacker@gmail.com>, <raj.khem@gmail.com>,
	<mathieu.dubois-briand@bootlin.com>, Ricardo Simoes
	<ricardo.simoes@pt.bosch.com>, Mark Jonas <mark.jonas@de.bosch.com>
Subject: [PATCH v3] dosfstools: Add ptests
Date: Tue, 15 Jul 2025 08:54:59 +0200
Message-ID: <20250715065459.6717-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.142.124.32]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D01:EE_|AM7PR10MB3480:EE_
X-MS-Office365-Filtering-Correlation-Id: 0313e05c-d1b0-44dc-14d4-08ddc36c9b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fO7EOqjRJyr/HvI++B4e21AhcMfZk1Cyxa//3Vt8HZ0C585tZIft0IBiBtcF?=
 =?us-ascii?Q?/viCPOs+3j/v74X7vDMAtM/9tQbl0U/1JGBkgd74x+kXHqCEb2k2AJv7TBIU?=
 =?us-ascii?Q?/cMrwlICuzCuuk8k0gLTHrd7KV8r0XRvYsU9Mp70YjGZrKngk50oLJ4sYp8a?=
 =?us-ascii?Q?qG7i3p+QQ9yHfENASYNfGFtw6UeMXic8yLBk0GK6Ua/9OzWx5LtA+ocqycmJ?=
 =?us-ascii?Q?47LJ6kKhKugkiePVyrsCrXv5T0oAMCrJr1/j4jQXVqMPS8313a5NPSQSx/aa?=
 =?us-ascii?Q?WlfgDIFA5GCFCkw9hIstzKpgN3n7AAVZFeHxh478l4+p9v6hn326FAexb6Oe?=
 =?us-ascii?Q?MlbdXJx+LIj0H64pefQXHL+jcxj486w5xhzI25Paa2X0JYpDR3x2C3p7C08F?=
 =?us-ascii?Q?GCniVT+cOh2zk1t7EPy7hn+cefJYQwsp3SpVhHelDzlC5wlwpa7ITIXDA8ND?=
 =?us-ascii?Q?pROQZmeG71v5t7vQYKA8dHMBt7aUrIgfwlQTYSfxvA8hdjWc30+opveCZeoY?=
 =?us-ascii?Q?YU4JQoVGDoDpb3ieeaTCWyObHdHRKVPASfePdpABj+sSmyygjx5zHA4RlEHM?=
 =?us-ascii?Q?2kpfBYCwbq0h3b/BbrzClLZv1ERl5yCdklyadx99Knqjtoohj0832VSg5vTn?=
 =?us-ascii?Q?a7qaPQX59yXbCNmSZApQ5//EQ1JJ8g/7bN7NQS71Z8W7rEXG+J+iq4gsNsj1?=
 =?us-ascii?Q?L855sy7dV2jTBRLyYQqflg504aFZhWjbEKvHVk7BquPLJMDLdV8tsWlI5H9Y?=
 =?us-ascii?Q?qqt0BlIHLR8hEWton03V9jIoTdKXKH9ql7081eaD/8iH3LNofg5xLJoXCb1s?=
 =?us-ascii?Q?l0/lbh3+LdxRC9px1vOtL0CUI1DEYao4VqLEBMH5TA1m1YwChojE4rgXznCn?=
 =?us-ascii?Q?CGfbgUgRZ9QAfuOlxF+wCGqOdow83bUlzgPQNztzIaw/HAS63/CJoYd7lDsK?=
 =?us-ascii?Q?dz7bJnSiFkQO3tZIp4tGI+f5q/zDiXdkBZQKsCbITr4lByiSv4pC/odmIn8o?=
 =?us-ascii?Q?Ngkt1RFxCOGItU5ygyBoRBm+OJNQ9RFv2475rtcOOKLaHjkL159arrl/5SNg?=
 =?us-ascii?Q?qFMV8o1dNPcVuNyAmFdTA29AwtJ7gsytoVPYO2W+0U1D37JLdIBgQMWyOMDa?=
 =?us-ascii?Q?El6YJz5aoVxPQCuwv1U32U3fPunfoJOI5E9cqEJl/1/F/taQ/iu/nkTc2mc9?=
 =?us-ascii?Q?lsr9AZwAtedtlZGP5JpZ0BtmujtquJeVvBQHXjyVejHypm4e3QBXuJboNXum?=
 =?us-ascii?Q?3eeWKDWSF+qnQ8eUMRkqt8kXYR5PW3eHiao1JcdWED1vnUomqHNifqF03jLk?=
 =?us-ascii?Q?Oorf/zPlgnbBgPyHiZXld9sdUSbUPAgTUZ2pIreKSxJD7afkazP5StdWUOjy?=
 =?us-ascii?Q?hLz7sueUmbdpgvzHCtFJdxT88anPq6CnHPEiW/3le/1+cVxusfpihC+MsIRM?=
 =?us-ascii?Q?p9WEVU7bymqoKxvBeOqlzkhApGghGvjzVcxKsFib3GOcgllb3SoK/vfhcmNL?=
 =?us-ascii?Q?bO9uRWnDm4r8M77p6nAtrXiflRUXfXOPKk5Z?=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 06:55:38.0116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0313e05c-d1b0-44dc-14d4-08ddc36c9b04
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3480
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 06:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220265

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
v1 -> v2:
  - Add missing RDEPENDS of ptest
  - Link tools to /usr/sbin instead of /sbin
v2 -> v3:
  - Use ${sbindir} instead of /usr/sbin
  - Use install instead of mkdir

 .../distro/include/ptest-packagelists.inc     |  1 +
 .../dosfstools/dosfstools_4.2.bb              | 30 ++++++++++++++++++-
 .../dosfstools/files/run-ptest                |  5 ++++
 3 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/dosfstools/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 4253c7b062..46c8945eb4 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -99,6 +99,7 @@ PTESTS_SLOW =3D "\
     coreutils \
     curl \
     dbus \
+    dosfstools \
     e2fsprogs \
     elfutils \
     gettext \
diff --git a/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb b/meta/reci=
pes-devtools/dosfstools/dosfstools_4.2.bb
index 86fb68f664..3b4c6b4a4b 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
@@ -10,18 +10,46 @@ LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae50=
4"

 SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
+           file://run-ptest \
            file://source-date-epoch.patch \
            file://0001-fsck.fat-Adhere-to-the-fsck-exit-codes.patch \
            file://0002-manpages-Document-fsck.fat-new-exit-codes.patch \
            "
 SRC_URI[sha256sum] =3D "64926eebf90092dca21b14259a5301b7b98e7b1943e8a201c7=
d726084809b527"

-inherit autotools gettext pkgconfig update-alternatives github-releases
+inherit autotools gettext pkgconfig ptest update-alternatives github-relea=
ses

 EXTRA_OECONF =3D "--enable-compat-symlinks --without-iconv"

 CFLAGS +=3D "-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64"

+do_install_ptest () {
+    install -d ${D}${PTEST_PATH}/tests
+    install -m 0744 ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    install -m 0744 ${S}/test-driver ${D}${PTEST_PATH}/tests/
+
+    install -d ${D}${PTEST_PATH}/src
+    ln -sf ${sbindir}/mkfs.fat ${D}${PTEST_PATH}/src/mkfs.fat
+    ln -sf ${sbindir}/fsck.fat ${D}${PTEST_PATH}/src/fsck.fat
+    ln -sf ${sbindir}/fatlabel ${D}${PTEST_PATH}/src/fatlabel
+
+    # dosfstools tests depends on variables defined in the tests/Makefile.
+    # To run the tests, we need to modify the following:
+    # - srcdir: used to find the test scripts for each dosfstools tools
+    # - top_srcdir: used to find the test-driver script
+    # - Makefile: originally used to recreate build rules when needed. The=
y're not needed here
+    #             because we only want to run the tests.
+    # - XXD_FOUND: Always satisfied by RDEPENDS of ptest package
+    sed \
+        -e 's/^srcdir =3D ..*/srcdir =3D \./'         \
+        -e 's/^top_srcdir =3D ..*/top_srcdir =3D \./' \
+        -e 's/^Makefile: ..*/Makefile: /'         \
+        -e 's/XXD_FOUND=3D/XXD_FOUND=3Dyes/'          \
+        ${B}/tests/Makefile > ${D}${PTEST_PATH}/tests/Makefile
+}
+
+RDEPENDS:${PN}-ptest +=3D "bash diffutils gawk make xxd"
+
 BBCLASSEXTEND =3D "native nativesdk"

 ALTERNATIVE_PRIORITY =3D "100"
diff --git a/meta/recipes-devtools/dosfstools/files/run-ptest b/meta/recipe=
s-devtools/dosfstools/files/run-ptest
new file mode 100644
index 0000000000..4f6e349a23
--- /dev/null
+++ b/meta/recipes-devtools/dosfstools/files/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+cd tests
+
+make check
--
2.34.1

