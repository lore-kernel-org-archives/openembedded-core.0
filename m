Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90343C83F03
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 12:17:07 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.141])
 by mx.groups.io with SMTP id smtpd.web11.11174.1751631420508641056
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 05:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=5X67R2LP;
 spf=pass (domain: navimatix.de, ip: 40.107.162.141, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnBFwwa6e1TOkS55r6l4naUAm0oXZ8P4/YKtJE4TO3ITrbZ4PgOMyfSLFC803VyyAXTaMVNozfjjAqlbN0obtDMLK8g1pD5mC8EpouY8fs7rhB+2i+At3XbZnljgcevrEizkbvHfPpmRKMgmgWx5u1EmKRz6EDmLczV+8I5RjR57R8xlyxk/tNYfOF88dYoX9Z3+dnXR7WRsTB3/6Fy150V4d/yMVxAjKSw5gXlWH734sebb/5H2MmqkxbHpiOtVeLZTpDHr+VBQC1asvrljT4ESpjhX26KpQg0K5GmJ1aCsTqUkPeRE1G4ot9httDHf5+kSf0RQZt5Ko+gNfWFDdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojbCTceTdQEtHAIkWums9ByjtjS53wDHv9Ah1Doqsfg=;
 b=EhWx8TAApsDP3pK5zcjEGlYupHb5IjldE9HuC9BcbfhEXHvVZcJBee1OIBsQ4/elfP5yLu4RuMyEHFj8M3SiLCH28OhUJLvvtxsEBecuXOz0xwGCHYOdl6ovFgYrl40ZXv7ToZ5777EebWXGG0k3FSETas+lfFQAEF2I8B3xWb8WRQx5MVaVnEQgE6aSteeuGMzek119QMTE4CBGGwAuNK9Rc4clLf5+Ia8yACAcEtXNvAUqGODUBB5e0iMlVpsbjqmss+BFxkOHAXybhUusczKz/yc1/X5D8VJbwhct1Yf59Mnp0FxPpd68szCgDZSQIsiS+Jh1juK7dMNHA6ghCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojbCTceTdQEtHAIkWums9ByjtjS53wDHv9Ah1Doqsfg=;
 b=5X67R2LP7Pf0NvmZwps6A8RRN90ADeEBIqkWZCg79kREcZmd/KxDvDzAhBtDxZ5XplNcm+M8v01nsgPGFYlmvoNKX8lYk1AOyGJbd1QbLxrS1DvO/sQyuNd+YgLpyJ7S24CS58X5vfPGWKYctei9y8/PgN5m7m5R8ZKcXgLYlI0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from PA4PR01MB7726.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:cb::18) by GV2PPF717C52CB5.eurprd01.prod.exchangelabs.com
 (2603:10a6:158:401::599) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.36; Fri, 4 Jul
 2025 12:16:54 +0000
Received: from PA4PR01MB7726.eurprd01.prod.exchangelabs.com
 ([fe80::412e:7f2b:cbfe:3d07]) by PA4PR01MB7726.eurprd01.prod.exchangelabs.com
 ([fe80::412e:7f2b:cbfe:3d07%5]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 12:16:53 +0000
Date: Fri, 4 Jul 2025 14:16:52 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, s.zhmylev@yadro.com, 
	alexandre.belloni@bootlin.com, richard.purdie@linuxfoundation.org, joerg.sommer@navimatix.de
CC: Sergei Zhmylev <s.zhmylev@yadro.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	=?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [kirkstone][PATCH] classes: Move package RDEPENDS processing out of
 debian.bbclass
Message-ID: <4f53825c14f9940ea8d379dcd35a5ae02bcb92e2.1751631411.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.48.1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::7) To PA4PR01MB7726.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:cb::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR01MB7726:EE_|GV2PPF717C52CB5:EE_
X-MS-Office365-Filtering-Correlation-Id: 0524e0df-238c-4d47-64bb-08ddbaf4a98e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4IDSjYg4OTV4jtVLG8L6lSDCO4hlEicKzO7pWFjyb1MA/lsx3I+fGteuv/A5?=
 =?us-ascii?Q?DpTrj53GCDA8fhuW7G68OmgUHdx6AEevQ056D6dB/GNXRad6sffhbxeJ7ZdE?=
 =?us-ascii?Q?vAzAmYLcY/i62TTfhqACu8OGvkV1wIX3PChsqQ7Lf1DM/YO1s731LiSphVzq?=
 =?us-ascii?Q?HD9w5h1g9bAbVfDyknddAWwr3INJMptplPpdom2+ftPHcWV13U3/bkyjCGms?=
 =?us-ascii?Q?JZ2GrhxENEbYMDYnnmfpk2qIe8v/TSlTUvt1c4CRgrCMp/RlqVSPpriNVGlQ?=
 =?us-ascii?Q?GSRuSqwe+fD5bNmCPxBg4BM1HnVL6fDBb3M8+pBzz0N++GYtqJxQq+6Hq35Y?=
 =?us-ascii?Q?gQC84KL/gPbNiI08wH7MWTDBfh4EA3HAAnL38S3A0mUwZ1mlX5rd3ig99Pe0?=
 =?us-ascii?Q?RVedfpfUfBT5ZNYcNda8Ww9a4dC7x4EZ9do5zmtJJqORQoJDNSPggg/Thsja?=
 =?us-ascii?Q?/Sgi/MY6nWQfosOjrW6sUK3Mnj9jI9n2jSI2E2nZH4W1+m4rhaFNYHQH0xxA?=
 =?us-ascii?Q?pT//eieFgUlNzULnGpkP8Jhsvn5ii1NojQD397G7YVyKrhAMI6hiX9UYWqqv?=
 =?us-ascii?Q?3vgjZkoU5oclahKkNep6XIG+dpVMnCBIyzRLVWq7YcaMZYEgxBq8J18CLqVG?=
 =?us-ascii?Q?JtzJRP94ZenKyKG2VFxOe+cTyeNGs6wrp6Undg7XE2LbuU1q9rQVXwW/V/T0?=
 =?us-ascii?Q?twEB2BjJTfc2raeosgGk5kz7z9qmCFy6wY2Jo9c0A6Si9AXNrGIcLp9uiR23?=
 =?us-ascii?Q?P+L+Tp20mHohI+ucXSRGrh+0hhibiHdDBtxZ0KTW3lDdGwzjGql85xeU4JH7?=
 =?us-ascii?Q?5kNRUO3ltD/++dAaGt+mXcDZ0ODCnKqscqgSf3jBwYz4IJSw1g8EETl1m9To?=
 =?us-ascii?Q?yRThkkiwjomriIC7pdBThg0MOgkTz3IUBq/+RrByqoBevNhoUDhXolsiQzvp?=
 =?us-ascii?Q?X/dcbtPOThsKEX8fYZdtY6Dda4zayFiSWynhjo/C6n2ux6VQcBLPT8YkG8xx?=
 =?us-ascii?Q?YNfrg8AKrOMCi6nR+Zniuu4FmklEL7jwlf2ciSOjXQ1CIt2ZUqA4S5vJ3BXl?=
 =?us-ascii?Q?Bwxfcb2n5p5jLftnpNHsLp4RV3wcqAb5D7/DSWt7U4PUTkWV22VX/xawqv5x?=
 =?us-ascii?Q?DgNo3a34wvGq/+NQy0pFTdcDpvVT8pb/x+twsE9Gu2VOQned9hKpD6iwxhxS?=
 =?us-ascii?Q?wha3Yu0GeBnqLHUPYzM4lg9OnP06D9JrEIMGBFmeUNYiPBKhSuOXmjINhGTI?=
 =?us-ascii?Q?8rDwKuNO3kZ29t0uYUzMrTCb9lDEa8sflejOH2GA2dqDsYUGMJY/nWz6zUUz?=
 =?us-ascii?Q?nw561gKPWxIKy1i2LWpJTEjHtJs/2eRjrAwT+EOaVJZpsznVGwrJk3Pkxles?=
 =?us-ascii?Q?yorzkml8mW/Vpd0qeH8aMmK6SWl+AZddFPewMp12x2PQDLgCqNvPa4M/OPwE?=
 =?us-ascii?Q?fC3U/9xHQNA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR01MB7726.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Lja+/agVKCoJQe155M/5cZHsF1xMg+jwfhYjiUJR5AZLUeWWjR2t4RIazxWu?=
 =?us-ascii?Q?uOo/bEyhoosY0dF3yq6LymPLN70FvhEwZTNg0uC6mSaNvxMXgRbA85WpNgPt?=
 =?us-ascii?Q?s+XpIZMn1zW1TsBvYtWhttHUc4TsmJM8D3QtOIWxowdvNUdQypfwFRh0LPxI?=
 =?us-ascii?Q?SHMG7WnUa8yKLZT2lZ6ieyMPOd+6u8ZTo9MWJy8BVZve/50QyhsacYGrDQMk?=
 =?us-ascii?Q?MJ6y5xLzIlwL+wOrBBpShQLJ3ClU01Vh1bqMcryrQbTkwBrXRhBetu3So62U?=
 =?us-ascii?Q?T6T8A1JSklA1pb8nrtFHI4tJUqVoiKN0ERT0vOBD4+PLK6qj/4Zq+Z94F13+?=
 =?us-ascii?Q?IdXi7k5mUOFhUN7fiYJQMz+ZMy7iziPklLoJAtxpszexCksNAFQ0yu+52qci?=
 =?us-ascii?Q?EyUeGkV0tRULfOGPE71U+4Zv+rGjzv4b/ryJ+K7df7GAO5aCqkQkUBtVXFqU?=
 =?us-ascii?Q?nfzAXC9yGQ5u8b1wImvAQuPIF/NbZnzwc6OPpH5S2mVz1Rkbgbjid0rdQwJu?=
 =?us-ascii?Q?xw5O5nLtz2RqJaTSm3pqJ+sS95C15iGal9tUFUjplJDFSBvGI48rAWekJRse?=
 =?us-ascii?Q?gyF7sC7TTuik00fSAFzi03DieUc+/oAev/rsEuo2xXL3tjmxSSuRumGFPiJr?=
 =?us-ascii?Q?JZvdqJQ2GbRIZRguBw6s44EoWRaVHS/Sa/gnJC8Y/ISNjbLyLeSIFSZ8HkCD?=
 =?us-ascii?Q?NizquXyTG4CEoX5e27KC6x8N19hPrOuQBUoXoUjXBLU4DV7zWXap/k3YEMue?=
 =?us-ascii?Q?6F4NCZg/gbFHbK8cCWEu2bIyCi1WhweFYw79GZVG90bFcrZ0mVEsATCxXE+P?=
 =?us-ascii?Q?BCQq6gRhXnrmsJB3f0adL56OT+AuYwLRyhedTr2FiD+wUJqsq/XGCcze7Cjy?=
 =?us-ascii?Q?Sb9R/Tbvseatw93xKVFhDp5DVVNIb+v3kUbavAgGGFOD/7WZH5DmhnaN4Fm7?=
 =?us-ascii?Q?OZyU+YfQSeuZzm24tIO5ygNM/etkxwi+NVjudou45lCcuXlsn7VD+ythm1J8?=
 =?us-ascii?Q?zXOaojAw4HtN3nZtYLPYvukP10K7U2+uJjBkIE7Kf7iDQJNpuPD420IsGmzH?=
 =?us-ascii?Q?n+xHQgqp1+VJET2ynXxm6WoRQWet8WENF71Y+Tz7o/yfYokzDGVU/+eSrApo?=
 =?us-ascii?Q?rL+TqLyoi2uXvQXzuT+nOgaLcJUFdU789wugOZ2rVXErF3RCeLWany1wNWqd?=
 =?us-ascii?Q?IQ7IA48znLH8zJo8rBVHIfP7VGN79auAyQGOVEc1BewI7beFthQbPIrJk0Gk?=
 =?us-ascii?Q?MI5YSz7TU0HLYWRqLQx6qktMmucjalPrGC4dmhe++ltz9+d/Wzw5XJWvnk/G?=
 =?us-ascii?Q?0cp6Q++/OZDRIKU1t4ZqBvAfKvV8AWemyZSTmhqcTqdSAvR/LmfqjzdwVaO2?=
 =?us-ascii?Q?C4WAS6fzdb5g2x7OM5ItKwgJTYbFR9nuUf9sFXoFkevOdpBCkLvTB/ZlS1RO?=
 =?us-ascii?Q?lgXP3L1FdYrvNOpNc+PbcrtL8HNqkv2ZhxmFY/tPJ/6/eTjHyOoDKsnv+hTx?=
 =?us-ascii?Q?PEU5j46yni6eOsKYyLrSi07x71PNiI2FtbZuAnETIajIX6d1WnfWltdSKxgu?=
 =?us-ascii?Q?MB7gy6N12IXUzXl4ykHB0/akRRRoQAtRwVV+yidURocYGvCkhYerL7ztsYZ7?=
 =?us-ascii?Q?NQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0524e0df-238c-4d47-64bb-08ddbaf4a98e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR01MB7726.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 12:16:53.7358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxMwCl4Y7SA3Mpg0ZJCb6aSnPfE3XXcOEeHhMVDQec9nrbcH66csoTaMd/URMmRmL53jfIOjxs3IIO/hEqbKO1K0bzwdgcruMhepwJXArzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PPF717C52CB5
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 12:17:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219918

From: Sergei Zhmylev <s.zhmylev@yadro.com>

INHERIT_DIRSTO by default includes debian.bbclass which in turn properly
establishes dependencies between package management tasks and build
process. Debian class also unconditionally renames several packages in a
Debian way. In order to allow disabling of such renaming rules, the logic
of RDEPENDS handling is moved to a package.bbclass.
This commit also solves the SDK building issue without debian.bbclass.

(From OE-Core rev: 8313a4201cde39c444aa6fbe82e46a767fc31f6b)

Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 251a5c88f6bcf347d637b39b8a86e8a083774986)
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/classes/debian.bbclass  | 18 +++---------------
 meta/classes/package.bbclass | 21 ++++++++++++++++++++-
 2 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/meta/classes/debian.bbclass b/meta/classes/debian.bbclass
index 8367be9f37..ade0e6dd8c 100644
--- a/meta/classes/debian.bbclass
+++ b/meta/classes/debian.bbclass
@@ -8,26 +8,14 @@
 #
 # Better expressed as ensure all RDEPENDS package before we package
 # This means we can't have circular RDEPENDS/RRECOMMENDS
+#
+# Logic of processing dependencies moved to a package.bbclass to
+# allow removing inheritance on debian.bbclass
=20
 AUTO_LIBNAME_PKGS =3D "${PACKAGES}"
=20
 inherit package
=20
-DEBIANRDEP =3D "do_packagedata"
-do_package_write_ipk[deptask] =3D "${DEBIANRDEP}"
-do_package_write_deb[deptask] =3D "${DEBIANRDEP}"
-do_package_write_tar[deptask] =3D "${DEBIANRDEP}"
-do_package_write_rpm[deptask] =3D "${DEBIANRDEP}"
-do_package_write_ipk[rdeptask] =3D "${DEBIANRDEP}"
-do_package_write_deb[rdeptask] =3D "${DEBIANRDEP}"
-do_package_write_tar[rdeptask] =3D "${DEBIANRDEP}"
-do_package_write_rpm[rdeptask] =3D "${DEBIANRDEP}"
-
-python () {
-    if not d.getVar("PACKAGES"):
-        d.setVar("DEBIANRDEP", "")
-}
-
 python debian_package_name_hook () {
     import glob, copy, stat, errno, re, pathlib, subprocess
=20
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index e6ba79346c..5cc3c779c0 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -54,7 +54,6 @@ ALL_MULTILIB_PACKAGE_ARCHS =3D "${@all_multilib_tune_valu=
es(d, 'PACKAGE_ARCHS')}"
 # dwarfsrcfiles is used to determine the list of debug source files
 PACKAGE_DEPENDS +=3D "rpm-native dwarfsrcfiles-native"
=20
-
 # If your postinstall can execute at rootfs creation time rather than on
 # target but depends on a native/cross tool in order to execute, you need =
to
 # list that tool in PACKAGE_WRITE_DEPS. Target package dependencies belong
@@ -2547,6 +2546,26 @@ python do_packagedata_setscene () {
 }
 addtask do_packagedata_setscene
=20
+# This part ensures all the runtime packages built by the time
+# dynamic renaming occures, if any.
+# This part moved here from debian.bbclass (see for reference) in
+# order to allow disabling default inheritance on debian package renaming.
+
+PKGRDEP =3D "do_packagedata"
+do_package_write_ipk[deptask] =3D "${PKGRDEP}"
+do_package_write_deb[deptask] =3D "${PKGRDEP}"
+do_package_write_tar[deptask] =3D "${PKGRDEP}"
+do_package_write_rpm[deptask] =3D "${PKGRDEP}"
+do_package_write_ipk[rdeptask] =3D "${PKGRDEP}"
+do_package_write_deb[rdeptask] =3D "${PKGRDEP}"
+do_package_write_tar[rdeptask] =3D "${PKGRDEP}"
+do_package_write_rpm[rdeptask] =3D "${PKGRDEP}"
+
+python () {
+    if not d.getVar("PACKAGES"):
+        d.setVar("PKGRDEP", "")
+}
+
 #
 # Helper functions for the package writing classes
 #
--=20
2.48.1


