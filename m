Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9308DC83F1A
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 16:54:39 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.63])
 by mx.groups.io with SMTP id smtpd.web11.18748.1752252870477150278
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jul 2025 09:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=annAM/ZF;
 spf=pass (domain: de.bosch.com, ip: 52.101.70.63, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXQ/Yw9kj8KtY5ge944bo/QD7fZWzYKq5jU9H9wZbSRcHn06AFVD+NFY9jSwtIXcgvP+VaYPyMH1Pl6K/KDdQBDoRguEAe+LeD9Vqv+K1RjfJWhPm/9KBBKbUWvPhVcDStgwuz4bPSqbiPyFgzRWBc3xs6ASUmEWtNoaH1UwrCWguWoRinpsnXud57RPJGfXlLCk3n8whhaNMyOCPt/MMdyFiLEq3Qhhne/ftavgZf63FtSDxG/frYN1TQ7Bjd3w+2Sx/24AZJM+t5uFUkd4TgvVyN2snsRav78xo+V2LMluW98ydyFOWl0SVrnYaA1W5uL3QWmJUHdZhLkmk+MS+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fouxwQZ9toBQMWkGNsniIgSadO0bwcCsih26Rmb43AQ=;
 b=SOIS6gJ9ZR/4gYOa8Tv72tD5q6kX3f2NCV7RiShIhwgFIkPb+zXXJ67rVF/P2mxw7bGpRKibuOMFoOi4DLSIX/vv81lqC42585KAQWXTqk8x1iy1s/1bGQE1FARTlAzQ9jFLuMFW1aVqVoivy3pSYyvhC8SEx0f7DSrwaAFsQkgXobZf3pzi/LMMOEumXQIdjTjCqKeFxjDp3+eMJ3rEry/oxViSxWBHq2YyvsZuISJL+Za6eCiXXLKOsikcTzUYqx68zNaGyqjki7A9daWKOOugRr1mgY9t3S0264VUJbidFIvksOlpq6GgHicAvWs4mAoRyTHaNoHoqJMFajBMYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fouxwQZ9toBQMWkGNsniIgSadO0bwcCsih26Rmb43AQ=;
 b=annAM/ZF/Etw2pmcbL3dgUUNnNmwVBmLwuUlGYRufAJvTCWjH+/DqEJxXSltLhxb11Qj6PAP+9QcfkTQWRWQdZ822g7jb9hsdGZfD6oQF76YlTStKef0Li6+9SM80cfsN6A4QfFztOKMXHNmsXR3TtoPz6r8zsXDLG2BL9JYggi6pjZn8RNK2vLTkhGso/Rjx6Jl1sd6BPTAAiUgkvr1Z6efOWkcuFpzWpeRFuyTiIfOWJVWZWO3hHNR2t/Tu228WJ8idvQC9ifcO4HdPUfoTtKivS1DC1o0+a4pQOopNeR4TeOkXHpkPAuZzJB3OTMDYQPsieiFQE7kkRalj27Tvg==
Received: from AS9PR01CA0046.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:542::24) by AS2PR10MB7069.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:597::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 11 Jul
 2025 16:54:26 +0000
Received: from AMS0EPF000001AA.eurprd05.prod.outlook.com
 (2603:10a6:20b:542:cafe::6e) by AS9PR01CA0046.outlook.office365.com
 (2603:10a6:20b:542::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.25 via Frontend Transport; Fri,
 11 Jul 2025 16:54:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AMS0EPF000001AA.mail.protection.outlook.com (10.167.16.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 16:54:25 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Fri, 11 Jul
 2025 18:54:25 +0200
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Fri, 11 Jul 2025 18:54:25 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.22.69.188) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 11 Jul 2025 18:54:24 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-core@lists.openembedded.org>
CC: <jpewhacker@gmail.com>, <raj.khem@gmail.com>,
	<mathieu.dubois-briand@bootlin.com>, Ricardo Simoes
	<ricardo.simoes@pt.bosch.com>, Mark Jonas <mark.jonas@de.bosch.com>
Subject: [PATCH v2] dosfstools: Add ptests
Date: Fri, 11 Jul 2025 18:53:44 +0200
Message-ID: <20250711165344.15438-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.22.69.188]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AA:EE_|AS2PR10MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: e224d79b-4e42-43a6-2731-08ddc09b97f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+XPQYhVLF3eR6MMRkXLKgVb2veFL4x+IQ3oMKiWbaLVtoD6Sb+913aq1sHMr?=
 =?us-ascii?Q?+5UgO9zWxX0+XXvAE7ae97y0yQqbbGkzKTrrg21o7uHuWviMaW1qUpk3Tfa/?=
 =?us-ascii?Q?Muim8FGUBAQuyADM9eI08rDd/LPbdLRO/mhtwsQo4qobnSntXeU9468QpFFj?=
 =?us-ascii?Q?1OgnNVkGghgFT4BYRaP3crii868N39NZOy1dGrYJmSW+OyxCAFKzyj39Q0oG?=
 =?us-ascii?Q?RCKZlUmQwrkgqM3wpw2hiBiXcqZCCtiWfdRQN+Ii9hiyx7eE+3wTzhN23QnO?=
 =?us-ascii?Q?MIZ3jCTBAgq+sYsu0AFc3Uhvn8Ea8/J893i9HY6h2PFvs6qciTl1CjCIfojx?=
 =?us-ascii?Q?ys3Y88mGozExifMJCfNGAPcB0UGMbe5UFGgPfnw7zEC8zTaNMY791hvzdLip?=
 =?us-ascii?Q?BInKnrcchZGQSHQ8AqLZu+Bjr3C1G7yAw7ssm8wbGkBnUrDm446y8H8w1OtX?=
 =?us-ascii?Q?ISxJUGGc6FE6qXqVqO0ArH2QANkLAOr23JyGxCpLS+0SWSfCcz8Jk/CoixcJ?=
 =?us-ascii?Q?4ZqDOqGx3zhWSSncnpSC9KmvjC1JijS162xu+yOi9fsMZCK5HZ+7YXmTH0b2?=
 =?us-ascii?Q?ROUzhc1cgpim82SaFsNLLTmnvm6fUB1Uofes1IS5Leh3vfJ9M3/dFD8zPeKV?=
 =?us-ascii?Q?+/LigHivrBCVHLePNUWleyk0ml5gaA73pSMIgUX/97YKP9Cyi9yrkxsbCSuI?=
 =?us-ascii?Q?ZbAF8QtnNkKSxgn6SCZKE7bMzjtZhX+87s8UgZ3NGZxicA6Jl535M6xdZlrX?=
 =?us-ascii?Q?XKSK0dCGeXzvH4lFLDipAM6dkqi21vlDdn9cKIY46vidxuLxZwbLSFx3VDPL?=
 =?us-ascii?Q?nyh6e7NqU9NgC5P+rB3ZKYc3gpeoIIle5N/I9ShAR3ZguAtb+e4HOCEHeeij?=
 =?us-ascii?Q?9P2k23XD6V91Wo4tuGquOKwEaa86OJqHVITDHp56fWaUNJI0EBvZpi0MBY6P?=
 =?us-ascii?Q?M5CotIwb+349YTjuDLWG+J4JKPN6meGoVDvun4RwO5s3+OnQMqGD4jrPzx3a?=
 =?us-ascii?Q?Dfxb6vwN159ufvBCDK8q5f9AVWJnGgbPp6SUGQPi8Tfa1060RQDT646flFLK?=
 =?us-ascii?Q?Rl1pI1/bozjp6JoikA5j5Cm6t6JD/VyIEHyYKoXicCMSMGJM5qnB9jZDXPNa?=
 =?us-ascii?Q?bv3brFdJ5RwYeYdhDR6KREgjH+s75v3DiA437kNRbN+w+S3yuqZlU4McFD7j?=
 =?us-ascii?Q?ltgrVC6ZFmOrt3jyV41Sh9szzdhB6fyG7354M76LDc8b9Sk0LoLg29Sk++04?=
 =?us-ascii?Q?XcbrtZWNMu2FcaxUYlgMqeIaznudBof9e/R1Ik1Yf/mgYr/9zJvB2HNvJWfu?=
 =?us-ascii?Q?MniTJQgGEBtNEETYFo8X99EilFxr+jxL2LU8WqAa+F9EGKWWNVkbK+8SIYUk?=
 =?us-ascii?Q?B6xbYL7BfeOC/8qEShRc9fQvLh9A0qU3qO3O6hy/eJxkQKQBxvJpfvGJFqYS?=
 =?us-ascii?Q?31xRlaNHUiBgNkmjpf8syCB7J/voagD/oRdT3/A40uchgwkgXVkDxX0vUzLo?=
 =?us-ascii?Q?qzb+edoXIYsVRR3MeiOnB6ud+PQ79gTe4mVn?=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 16:54:25.7954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e224d79b-4e42-43a6-2731-08ddc09b97f9
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 16:54:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220162

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
v1 -> v2:
  - Add missing RDEPENDS of ptest
  - Link tools to /usr/sbin instead of /sbin=20

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
index 86fb68f664..0772f39381 100644
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
+    ln -sf /usr/sbin/mkfs.fat ${D}${PTEST_PATH}/src/mkfs.fat
+    ln -sf /usr/sbin/fsck.fat ${D}${PTEST_PATH}/src/fsck.fat
+    ln -sf /usr/sbin/fatlabel ${D}${PTEST_PATH}/src/fatlabel
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


