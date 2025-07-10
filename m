Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34681C83F17
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 14:21:04 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.54])
 by mx.groups.io with SMTP id smtpd.web10.10039.1752157260580626187
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jul 2025 07:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=CC06LT06;
 spf=pass (domain: de.bosch.com, ip: 52.101.84.54, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ahadff5YsX/YCWGZx5najeFFQgZkB+T+nS44aDbRy6bql+w2Ts3Z5Dwyfo+Fx5wePhmznDWkNVAlXC74aiSlZSQTnG1ekZXQxO5REdmjCrkRr0csowMWA19UlCB5GhtZY3bVvV/7UhXa0gzopQMyKRdLnDizsWtUaVrq9EA4toIItT+JCtHuPf8FvcXGvOXNYkYXV6DW8KkZ07kL2PGrmIRc4OzZp7boHJuvpQSd0CSLIv3IVHLO0w8+YQKesICMtOZte7ay0jzCL0eiaIp6sitw/DCngVP40DtCRam9sng/bi/H5ff7ZMou6DngSt48EobcLBda335mPGJIxRGaNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSXJkeV7yjYpD11QsRoJ6mwQU8IbZ0xMIJpAUMwpA4Y=;
 b=lykYRa2plLBjP6i1aI61AyQuBEohN+zrPUhwDWH3QOAw98HiwQAWVApWdqy3Z3e0Hd9BquGTHix+bKSTX2zH80ShbEwFY6dOXuBvSy2N9IhmBrzEeWOWdxRua0Gjbf84a7T7/kA+5rZbIx9ATKT65JbXM9uLNaRdtjKDtxm4IhBvVar+7ZvUL1y2zdCblTJ64Qxq7PKx1Bv7uhiM9Fsd0+3CH20fYs9Wovpz380QnPcQkzeAnlC+UsJ3jXWxmNlwUDDfYkhArVFqlMH61poZ1lzqiQ2rB9s6sxmoj9+Vd5oh+JlLSKv4l1Ij1GGfQZxvpfZDwWROAJwoxS6qgjzoMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSXJkeV7yjYpD11QsRoJ6mwQU8IbZ0xMIJpAUMwpA4Y=;
 b=CC06LT064ETthUCGQZp++DjScCDp9CFF1UDSYCKSdQhNsk/kC+rNAzlJNOpiP1i9yJW9Fi64MaP+aOsa55VZytBneKjOpkIkQg0LSAD2O+JQI7Y8qZWCyD8knZSU21oQC1DHHtMguLw46gbuOMOcV9Fyw0AcUq2axdX0AZEKWJYikxCVYu+G7mvMb4mji0+5OotZdCBMJaHlX2m6fWFw3BfQreITOK7t9sb5TieBMI0b6mzEx9v7KLvq2VWtAu/LdBVNBHOmocCNro3ps0OgbFCoSkIAHyIpzAQXZMjViiVlXG5nXAMw+U0Yf2N6FfaLtQewRsnPk39VNZ1UthoBVA==
Received: from CWLP123CA0018.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:56::30)
 by PAXPR10MB5278.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:28f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 14:20:56 +0000
Received: from AM1PEPF000252DB.eurprd07.prod.outlook.com
 (2603:10a6:401:56:cafe::e) by CWLP123CA0018.outlook.office365.com
 (2603:10a6:401:56::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Thu,
 10 Jul 2025 14:20:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AM1PEPF000252DB.mail.protection.outlook.com (10.167.16.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Thu, 10 Jul 2025 14:20:55 +0000
Received: from FE-EXCAS2001.de.bosch.com (10.139.217.200) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Thu, 10 Jul
 2025 16:20:55 +0200
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by
 FE-EXCAS2001.de.bosch.com (10.139.217.200) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Thu, 10 Jul 2025 16:20:55 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.143.161.227) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 10 Jul 2025 16:20:54 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-core@lists.openembedded.org>
CC: <jpewhacker@gmail.com>, <raj.khem@gmail.com>, Ricardo Simoes
	<ricardo.simoes@pt.bosch.com>, Mark Jonas <mark.jonas@de.bosch.com>
Subject: [PATCH] dosfstools: Add ptests
Date: Thu, 10 Jul 2025 16:20:15 +0200
Message-ID: <20250710142015.174053-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.143.161.227]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DB:EE_|PAXPR10MB5278:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a0fc555-3579-4c8c-2c39-08ddbfbcfbdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?x/rD3dfyzML1gOJYXa6gbRnakPoMYBya9YXetQyz0i9EcfFMu1jMG37osENR?=
 =?us-ascii?Q?GULRM/LMWtNEfCdSAXnkwkwQa6NdkcqXDqq3vNMR9GuRRX5nuk/vNiF3trM9?=
 =?us-ascii?Q?NlMGtqXPKyhLD6tUfvL7pSplrxRthF3WDlwBIxj+DBhKV4zQ3Omu8h+7OWIk?=
 =?us-ascii?Q?hDTFJzmchUoZ/7eSEcaPFaP1KGmjUnuJ/GZp9OtknUjNh5dNWpZlEz7S2xdb?=
 =?us-ascii?Q?H/iZ8SaCTh6qDI+HutBmh0zjEV3/F8iEuoWXg3KvvAykR5bJZ1oihV83xLAw?=
 =?us-ascii?Q?F5E48pZwRRy+03Aqt+S7BpdZ+9dximEOiKQcK6o2lYyhE+zzV1Tm36sQUg8R?=
 =?us-ascii?Q?q1KhJvqnThJvptDtLb1kO9mwBJvAjH/I9NhoGrC6f3mtpBSggx4Oz/0heIs5?=
 =?us-ascii?Q?A/2EvWhLDLgUESbRqp4NBSGz/xB9Bi1xSw82uf+C6iQGPTYSmjkhI1xGPWjp?=
 =?us-ascii?Q?MdC/imalCK4JGFvzjN6/WwBUwHWkdkWCxn3yvTDWJvlVx1jWNDUHUni/MmeM?=
 =?us-ascii?Q?wStFEw62FFhguEVfzEUfwiTl7qGh2WIQgd8tkytF4Ry7lkRMX9wRgaUBiZhJ?=
 =?us-ascii?Q?ghLAPTdc/KtX83uk44jCQteUIBYk8zhno8EmhbIdtRNX7uwexaWAqdqhfcgY?=
 =?us-ascii?Q?9+mEddr+/HCkq0so+jiTa9lKy3KaIyylX+z+taSOEB4peoezvmmyJ9xcYn2V?=
 =?us-ascii?Q?HRxhUWsSIh8vyEpMMKNoBwSELW0di6yh7kVzzz2yfdeh1r8w1r+yG0ZJ3cXx?=
 =?us-ascii?Q?X6pP1qTUaRMI0VL7dfbVX+BFlnFqUjweZ4pbsV23AjLaYHUyc99IcHxBUgNF?=
 =?us-ascii?Q?XqSITdGaGDCvwJjuCV5QZpC5+NCgXrYLoNSv1ijEGuxryV1UDf2BS73FcUcu?=
 =?us-ascii?Q?R2nW1csS4ocQgVblo3W+XLq4J2vJjvkv9t4/byvRYJFDHcGJFGJ6woh2uMgt?=
 =?us-ascii?Q?1S33MM5gxyweiIaxdpiGc3Sdwi07DJPdBHUVdLOrl+Vd/U4jIRDm4jny3SA+?=
 =?us-ascii?Q?E3RYObAXadbXCV4bY4w9wNIbVq8a3hg/muVjJ1z15rvFf/QOSx7wVuATaq21?=
 =?us-ascii?Q?Yej7U2OKE6nm9Jnl1fwzuAwpyJgv607u1nnpq5Bq4pT9SDDlAfFeRg3zcPkp?=
 =?us-ascii?Q?QMKWC2BuvIKg9ziiakn1pq7XiYVaHRLiMt33SLWAz8PrfiMK8g45ZBsZYIIT?=
 =?us-ascii?Q?LeCj+QUZ28Cb64Ql5thDU7qdrH9+HZInGDh8s2vb/3n8Kp2l45VUNbVNUnWR?=
 =?us-ascii?Q?S1E3UXXfkVkNqoTcFJNEet/23wgdKZL7Q63gSLa5nwvfV+FmRX9YnIElBx0j?=
 =?us-ascii?Q?uJgH0P90godfBRtB1AcU2lPksdVAw4p4RAO3ZeDhed9iGVz7onsC3cN1n6Ts?=
 =?us-ascii?Q?5+SWW/nAwucqVoArkNFw3gtXM9URlwW9pRPnjPBIARkzQGLZIZhOZRqWkdbW?=
 =?us-ascii?Q?LBGwSD9Ec94PQ0mzne159SaO/r46+Hoj0p2pekWNapyQRlBY2N6ueo8FTDHh?=
 =?us-ascii?Q?fTqffwxjX1cIg6llHrJS4QncWxlJg+XnuDyp?=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 14:20:55.6092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0fc555-3579-4c8c-2c39-08ddbfbcfbdd
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DB.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5278
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 14:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220121

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
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
index 86fb68f664..a7ba279f3a 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
@@ -10,18 +10,46 @@ LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae50=
4"
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
+           file://run-ptest \
            file://source-date-epoch.patch \
            file://0001-fsck.fat-Adhere-to-the-fsck-exit-codes.patch \
            file://0002-manpages-Document-fsck.fat-new-exit-codes.patch \
            "
 SRC_URI[sha256sum] =3D "64926eebf90092dca21b14259a5301b7b98e7b1943e8a201c7=
d726084809b527"
=20
-inherit autotools gettext pkgconfig update-alternatives github-releases
+inherit autotools gettext pkgconfig ptest update-alternatives github-relea=
ses
=20
 EXTRA_OECONF =3D "--enable-compat-symlinks --without-iconv"
=20
 CFLAGS +=3D "-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64"
=20
+do_install_ptest () {
+    mkdir -p ${D}${PTEST_PATH}/tests
+    install -m 0744 ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    install -m 0744 ${S}/test-driver ${D}${PTEST_PATH}/tests/
+
+    mkdir -p ${D}${PTEST_PATH}/src
+    ln -sf /sbin/mkfs.fat ${D}${PTEST_PATH}/src/mkfs.fat
+    ln -sf /sbin/fsck.fat ${D}${PTEST_PATH}/src/fsck.fat
+    ln -sf /sbin/fatlabel ${D}${PTEST_PATH}/src/fatlabel
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
+RDEPENDS:${PN}-ptest +=3D "make xxd gawk"
+
 BBCLASSEXTEND =3D "native nativesdk"
=20
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
--=20
2.34.1


