Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B9F2C3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 20:15:57 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.60])
 by mx.groups.io with SMTP id smtpd.web11.56303.1723493750511219919
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 13:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=PkszKJzV;
 spf=pass (domain: axis.com, ip: 52.101.69.60, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LIML/OVcLiBhSdzkuV0MiUxYu2jzVOuKMkOYctoVTTE5IQx3NZyYNR5Cejo3WzYixVurzodHUNdiB7OTEO4kgnun0N0k0RJlD8uTrJBOi7XOGtkpL5QeJ2xxfmRWmevBpYFNk1OW8H9dRXYsWFWJJg5YDDl46Oc07swdYFUQ/AmzEaruV+8siINEijKPAqfx/gL+bGdWfuKSY4+ib1nFR25ugEqt2cCa25LkdYMTR1enPpfNih99pAtidp2heQ3X2M3BeuNs5gsEGmT6yL+po90mbckP//aLnKtn/1+Hz3fY8rEjVV5/QIJNrni9ZX6r8s1IjLju3HeD+U8eBefGTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxiKh7wlQ3nZyzpE2L9p5FPthHLjXB9JAMGaU0BjxEM=;
 b=Pz4O0icHSU7cWx+/Q3fh5mIbhFcnPRCCI3USKAE+qzTD6PwS16K4rUzsz2OPD7yrSh+zBCjh2Rsej4o1Wlg2rEKFekQ39Cj05IZWdl02hDu/1ogfu5f4qk4jFm+pdlMk0UHwg/qyFau3hwsa6UbsCwyNr5cDol2wJLu94uEu5r7yu/jeIeSIQy3VM9yCF8EjhW31Z5zk/ArEea3G1h0DFHMceWj/74zseRMzsxaX58+8NXgNtJVSaSuQiSGV48eXfI2ykEEZK6H6fGIXXI6ptoup5mMQndFOBMNrorgqVTrwVcWVGDWAEFwMWnfIWF/kp1cRCya16BY8peAihtOd+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxiKh7wlQ3nZyzpE2L9p5FPthHLjXB9JAMGaU0BjxEM=;
 b=PkszKJzVlb38BwwSSap1ysYbHFgGo1nu6HOfLGyZpnkBVtsxS8b0QqblBxGeaYjUIgKgZKdlfYpPB1nmXnZqfdfVcY8mlRe/En30b6B5to4bobsBeOQnkEAgJmyWFgFYyIfv7aK9bGm7cuv3n4DBpZ9J8vvCBm+cYS9kN8ErmtM=
Received: from DB9PR01CA0008.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::13) by PAWPR02MB10067.eurprd02.prod.outlook.com
 (2603:10a6:102:35b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 20:15:45 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::e0) by DB9PR01CA0008.outlook.office365.com
 (2603:10a6:10:1d8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20 via Frontend
 Transport; Mon, 12 Aug 2024 20:15:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 12 Aug 2024 20:15:44 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Aug
 2024 22:15:44 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 12 Aug 2024 22:15:44 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 02A14188
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 22:15:44 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 47CKFhPl3080841
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 22:15:43 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 47CKFhlw3080840
	for openembedded-core@lists.openembedded.org; Mon, 12 Aug 2024 22:15:43 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] license_image.bbclass: Rename license-incompatible to license-exception
Date: Mon, 12 Aug 2024 22:15:39 +0200
Message-ID: <20240812201539.3080819-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FE:EE_|PAWPR02MB10067:EE_
X-MS-Office365-Filtering-Correlation-Id: 8589cf9f-85e9-46f8-3e71-08dcbb0b8be9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9t+r0pOEE44nrAlbtCP6EdhfX8U9wpMP8T8/MiFjgG0eL4SFSqfmR6hZPKxe?=
 =?us-ascii?Q?t6Hvhc8OO7prK1jF2PJb8pauCbW8EdRPbZS9nwwscTnStfikQUIO7Bwa5BuO?=
 =?us-ascii?Q?Ft9qivyUhuKwEyXQ+QhzDqS0SIzxHL0PwxRGoJItfvapiTIMWi15pM7KZ63K?=
 =?us-ascii?Q?Y2DbA/qVMgUbImVFMHSgUExPMecbum2u8QPi539u0QxwPXsAoNg4L4tMUmJG?=
 =?us-ascii?Q?r0H3xMqE1oJDY3IvwWR5q0/94fTOeLHHkvg0Rs3r2KAxUp0iHiQoH8t++U3j?=
 =?us-ascii?Q?yYFEGCCXxBZTQMnVV4He8YgIq4r7IMgxqtsed6PHsa6DYOVbxxkb5ogRPQAI?=
 =?us-ascii?Q?nwiAVd9LxNdPnf9gCf8ShL9NE1IRCqYjqUi1mUDuxlYdOtiKTUeKiZs41aT+?=
 =?us-ascii?Q?hGoA1uM6kbvWA2VgKPygYg+wosRnMzLymr1+N2tYw+lAqBPNnH3wAkAT37ZF?=
 =?us-ascii?Q?Wabzv6UR+Yv71usSbai40cCZW1+CDcuWlgqQlxn7WU0q2ZYI6vZu9IsqZJ4Q?=
 =?us-ascii?Q?BATLQIJqZ5OCECfiBhw2TT7EUVt9kGBZRv713BwEDrC118qV710DqYnrS+Wm?=
 =?us-ascii?Q?orHbcPY1a0lNx2vtZH9hgWNuvNQoEyNZCDRvGNUgMOHG5M7kkQF3ZJnOcBkZ?=
 =?us-ascii?Q?BhBuu7ngMSA9a6gleoSNyZr2JpoDHqzeD2JrxhN5A3DGoC1NljLUpICaBT2I?=
 =?us-ascii?Q?wPHyHPxb0ipRPY/EoFBFl9XxAV44sAVBCh8vM3rNdgYbIsz481+tIGSNtXIS?=
 =?us-ascii?Q?RjM1rd2PGynHI1iBodFQsicPuFNNlgnmsrrriUU77vb1CQMVsrPhzp8I3fnL?=
 =?us-ascii?Q?54/+5gzh2b2fBkfv28dz/JIx/kKNCGiIsKRQO9XsG66yTJEi2m6aR5X+wMgX?=
 =?us-ascii?Q?ZlilqmRBErIMcVBbqsOwgqorv8+mG3B3lM0dpnTWm48FmBgAFNw6AV7tqHia?=
 =?us-ascii?Q?SoA+8drZu0hCHFD9NZXQS0x0Z2cBq5pvqbHqQoNgm4pfC9iSzcVrzygxW1V3?=
 =?us-ascii?Q?kQbUUAxa63qSS6244NwAlN0p+IUBdCpH5edn3IoXIIwF09iejpLdmovaoJOj?=
 =?us-ascii?Q?OtP0wbqxq2z4HmnNI7fISGldtirJQorEbmJ6uZ8vivuZ62mCfwlxGt4AUj3K?=
 =?us-ascii?Q?bzpSV/+USqHEb8QxhVJSnQKerc5p4rbEprutnO51ukPRb+wD+HiOQ3+6TE4F?=
 =?us-ascii?Q?DIjsMtishemXuqWwcIEtdL3h8kP/NRwkEi3OPbpwNY64TbbxECn4d0Cpkg0i?=
 =?us-ascii?Q?b10uwL3Lxp1Mbe3Tr6h+1EtMDphFNrSBYboKlZWdpLbFgYeOxMxRM/642K1+?=
 =?us-ascii?Q?QQEvl1nK3HYNPvnmMZaIaH5wsdqpkd8DpvH45jIoQZd/b9Zbqy9JuELLQi61?=
 =?us-ascii?Q?t+Ta4oD0ye0ChfbAX+EarxbdC0NjPbp+GqrJNenyIOz42HEPqai3wXnKehtG?=
 =?us-ascii?Q?tGukFMbMO8E0KSaiEJTeref5uz2aG+s1?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 20:15:44.5339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8589cf9f-85e9-46f8-3e71-08dcbb0b8be9
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB10067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 20:15:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203233

There is currently both an incompatible-license and a
license-incompatible QA message. This is very confusing.
However, license-incompatible is only used to output a message when a
package is included in an image despite it having a license that is
normally incompatible (by using the INCOMPATIBLE_LICENSE_EXCEPTIONS
variable). To better match how it is used and to distinguish it from
incompatible-license, rename it to license-exception.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-global/insane.bbclass               | 2 +-
 meta/classes-recipe/license_image.bbclass        | 2 +-
 meta/lib/oeqa/selftest/cases/incompatible_lic.py | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insan=
e.bbclass
index 04eb88364e5..6a84c4aa74d 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -34,7 +34,7 @@ ERROR_QA ?=3D "dev-so debug-deps dev-deps debug-files arc=
h pkgconfig la \
             mime mime-xdg unlisted-pkg-lics unhandled-features-check \
             missing-update-alternatives missing-ptest \
             license-exists license-no-generic license-syntax license-forma=
t \
-            license-incompatible license-file-missing obsolete-license \
+            license-exception license-file-missing obsolete-license \
             libdir xorg-driver-abi buildpaths \
             dep-cmp pkgvarcheck perm-config perm-line perm-link \
             packages-list pkgv-undefined var-undefined \
diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-recip=
e/license_image.bbclass
index 19b3dc55ba2..0e953856a63 100644
--- a/meta/classes-recipe/license_image.bbclass
+++ b/meta/classes-recipe/license_image.bbclass
@@ -72,7 +72,7 @@ def write_license_files(d, license_manifest, pkg_dic, roo=
tfs=3DTrue):
             else:
                 incompatible_licenses =3D incompatible_pkg_license(d, bad_=
licenses, pkg_dic[pkg]["LICENSE"])
                 if incompatible_licenses:
-                    oe.qa.handle_error('license-incompatible', "Including =
%s with incompatible license(s) %s into the image, because it has been allo=
wed by exception list." %(pkg, ' '.join(incompatible_licenses)), d)
+                    oe.qa.handle_error('license-exception', "Including %s =
with incompatible license(s) %s into the image, because it has been allowed=
 by exception list." %(pkg, ' '.join(incompatible_licenses)), d)
             try:
                 (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"]) =3D \
                     oe.license.manifest_licenses(pkg_dic[pkg]["LICENSE"],
diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oe=
qa/selftest/cases/incompatible_lic.py
index 4c228de6a33..439c1b9f0ec 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -128,7 +128,7 @@ INCOMPATIBLE_LICENSE:pn-core-image-minimal =3D "GPL-3.0=
* LGPL-3.0*"
         bitbake('core-image-minimal')
=20
     def test_bash_license_exceptions(self):
-        self.write_config(self.default_config() + '\nINCOMPATIBLE_LICENSE_=
EXCEPTIONS:pn-core-image-minimal =3D "bash:GPL-3.0-or-later"\nERROR_QA:remo=
ve =3D "license-incompatible"')
+        self.write_config(self.default_config() + '\nINCOMPATIBLE_LICENSE_=
EXCEPTIONS:pn-core-image-minimal =3D "bash:GPL-3.0-or-later"\nERROR_QA:remo=
ve =3D "license-exception"')
=20
         bitbake('core-image-minimal')
=20

