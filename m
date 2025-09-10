Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9879CA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 13:25:11 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.15])
 by mx.groups.io with SMTP id smtpd.web11.17664.1757510703681069831
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 06:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=JkMnuxW5;
 spf=pass (domain: axis.com, ip: 52.101.70.15, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wlGtQHKFlX1aNLbs+6j7Cyy1zCy/N2yMTBUg4ZLlZWTb/F/RxmE2cJnIi2zkZnvkqcigxcbKGZhB6V5m7obl4G9deCAu7vrp4LPDispIUgYXwiYJ+UHWP/XR8MEkpmF9UQQoGwM8QY5Ettt0LgV48xfiJB2yDUEq+RkGLKt9rlKU+Kf+ULQPrIDBEZvX5sS9dS5M9kdlOtOq/hkgL4JT9vl9uAxexxY/hQM10F9ev/FrW4Py4aLPnk9v1cOBeum30P5hd4RMjOC0N09AskzaFeyyyjZO44Hf5ECRV+KNS8rSPfdi30anmvP+EMnv4gzz8dFDCuL+noggu5lGRqHXEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5pUPJeNZ9GkV+098HxqDL2854R1P4yXJlZ042NSsAg=;
 b=PPiRh8LQ0hjqRF/iBluiBei5zTHarQOSeZ2QfiS821BdCLPePGTCP56gxz1t8yl2Gw7A4XJ+hSqBrh8lmX54jGKjRFDvmYOs1pQ0xNbcJrnqPvNKDHEDZSU7w2VFmKLKVYkAw4ItWI9qywjbdZkSGBmbcAtJj0w7zB/ZFwTztmPuyB9vTjpFpnIZHyK5TRCSvhRvX/lWk9JahPo8WDmhWlzjHiWO8kZ//X10v4o2gYJBoU/qDoyQu59rVZ+F5MFpvxmIDLWBqkSKM1kYVMc/yxkWfh64z1XrPEvAmuQ+HNvkgBMY2HvK1iPLvR2q4O74LWGYjvNB6/X4E12ta/qeCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5pUPJeNZ9GkV+098HxqDL2854R1P4yXJlZ042NSsAg=;
 b=JkMnuxW5tcwVUscpN+0Y3xpi3ON7ktlhmKbNdjdUift3w86tb4XvA4UGvxAUp1oey+PXdOx3XWuAqFbIB79HPdJfZjhl240KmZ5eC2+d0f0XvFGbXaHw1m/IxHYQKuc2jWjwsbQq63h1RGuEtaHZ/OkqTvptuE4YgMRhbwKi3zo=
Received: from DUZPR01CA0332.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::18) by AS8PR02MB6597.eurprd02.prod.outlook.com
 (2603:10a6:20b:255::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 13:24:59 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::dd) by DUZPR01CA0332.outlook.office365.com
 (2603:10a6:10:4b8::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.16 via Frontend Transport; Wed,
 10 Sep 2025 13:25:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 13:24:58 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Wed, 10 Sep
 2025 15:24:57 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 10 Sep 2025 15:24:57 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id CF9391BF7
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 15:24:57 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 6DE9D122A26; Wed, 10 Sep 2025 15:24:57 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] meson: Backport patches to support dependencies on header-only Boost libs
Date: Wed, 10 Sep 2025 15:24:52 +0200
Message-ID: <20250910132452.3929251-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F5:EE_|AS8PR02MB6597:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d5ad331-8b9a-4891-18f9-08ddf06d705e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?j39xfl6EC0sgv7KweUFQUtIPiecnQTVdZ2XZ9g7qznB6uCTosBNKFxLJKyHm?=
 =?us-ascii?Q?iHZ4g+e9qmgT+NMmx1PHuK7RIK05eRHoMPRTtzw5eCQigkK/HDltdlYs9WQV?=
 =?us-ascii?Q?tH0lBrK6KcXM5GVvCJVEBwrSUYUk08QnDEl7lPpmfy9/zlL1AG7xUv/srYd9?=
 =?us-ascii?Q?32gfPxx8RsuERITVHBD/kyH8TeCpxuH3jP8n6iXRhXdfeG63WwLPT9PmUAet?=
 =?us-ascii?Q?iU8P2RkCAKrhFm6GFeprkIQLutqHlP19VaTDKCyATcESCMGBdMvkcPHqF1NB?=
 =?us-ascii?Q?9dIGyl20xonG8Qdm67VpqEw8CF99VaKIDnV8tcJRtvjYClIMTjPPN2Z8ihnj?=
 =?us-ascii?Q?QhsbsJaktzYSJQA6Tjz/KQ/F/Dnxi8zp9tl7PwCF9bBdbWUknvGZ/aqdFTGQ?=
 =?us-ascii?Q?X9xJtB1XsCDwww6iERyGHKXW1L9jn04uOBrWa/Vz75RHw8evE6CKGsB+vk5o?=
 =?us-ascii?Q?k/1FSPeXjGEsyV5iS0dAEYtmW1SVGH9NOqc+cue3S94zh4ZcSWfFACGvLLch?=
 =?us-ascii?Q?Z3+oVqTrgPtTkqNqJ1KGGMYn/fFQOlq8XstdMGcPYx8ipmBSwuisiaieLp8P?=
 =?us-ascii?Q?80iVBBoYZVK2Aq2F4mG7ydg39kZATiAriUarpcMNOOMNTZtjGKMwT9LKPbba?=
 =?us-ascii?Q?n1+78a5GuhPrkAgoyteKeNcfzUlNZttOGtCNVRYTAjS1abv0wH1HMGHnJ4tA?=
 =?us-ascii?Q?rW2/uyRP8Heavc5Lso9qARsQEGt2BspiaMfL2ZnvqmJmFYY3sK8gaZGRBCl/?=
 =?us-ascii?Q?/56FtKc1dg9I2uXajfaEGSmxYsbqweB3fuIkb24bLDfboLQbZ0wr4z2itd7j?=
 =?us-ascii?Q?yoxNGO2nqEpqoGFO04bRUqQcX+XqyYsrJaKlYaypNCmWSNjmeY2qjaTv8cci?=
 =?us-ascii?Q?MnNHSWP7NDPBfuW4G9MVulbUN96S5DGlMuP50ZCVyZ1D82eR0dMdqdEfyczk?=
 =?us-ascii?Q?Y75F9WI/FGDk3GttS87nWCVF3o4CZVbX4pr5zjauPkUEA4CsDPbOoCHfkARr?=
 =?us-ascii?Q?Cm6Aim635fF2VYbodgDQ3IlLNQ9UJn2FV8cZWvERD4hbgd7sXedM24ei5M1c?=
 =?us-ascii?Q?arGR1wzvGJDRk0+4Eni2M893xX6Y9IdhJtq7f2eBdSqJQZcDCCCAqUKR8fVf?=
 =?us-ascii?Q?c58rKSQxcbzLbGUEhNIJ8FD+JohVvsDAZy4LsLEgVVHgYycXUs+yxLnkmAc1?=
 =?us-ascii?Q?fHAmBnhBV1U1GnuEG+mM1z5AT9jIkdvUS2ykck3Su4cApY1xw75UZK7drwim?=
 =?us-ascii?Q?+rKXDXobmmIpaa19UckAwFy0umgKi4ydUOQfH0OKP7G/FygUrdXCl1DlXicN?=
 =?us-ascii?Q?LYf5U9Ld7jtMFf1x4VBHQFWD1nljl8DyJnrZNsK6YPNwFCpPaeeVMQibHfAs?=
 =?us-ascii?Q?qkJFD4U0ij2ElDn4TraYTWJLrvKvYYS3Bk5V+/ws3EbAKVBU7whNxIJXWBSJ?=
 =?us-ascii?Q?5pyIFIYnuNQ9QGEeqm2AggLtDnPFWx8osoZaAe09mYbZUdvxvuUQNFsBqb97?=
 =?us-ascii?Q?w+Pvy1HpubEjHAxns6R2Vf7fto+687hjPyO1cEsmLR1HaKgcKb2astTTmQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 13:24:58.3266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5ad331-8b9a-4891-18f9-08ddf06d705e
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6597
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 13:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223209

With Boost 1.89.0, the Boost.System library was made header-only. Since
this is a frequent library to have as dependency in meson.build files,
this resulted in build failures.

Backport two patches so that Boost dependencies on header-only libraries
work as expected.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...heck-for-header-only-Boost-libraries.patch | 58 +++++++++++++++++++
 ...python-must-have-a-library-component.patch | 34 +++++++++++
 meta/recipes-devtools/meson/meson_1.8.2.bb    |  2 +
 3 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/0001-Check-for-header=
-only-Boost-libraries.patch
 create mode 100644 meta/recipes-devtools/meson/meson/0002-Boost-python-mus=
t-have-a-library-component.patch

diff --git a/meta/recipes-devtools/meson/meson/0001-Check-for-header-only-B=
oost-libraries.patch b/meta/recipes-devtools/meson/meson/0001-Check-for-hea=
der-only-Boost-libraries.patch
new file mode 100644
index 0000000000..3d2810aff9
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0001-Check-for-header-only-Boost-li=
braries.patch
@@ -0,0 +1,58 @@
+From f16897135c394d36656da0078613864076300e07 Mon Sep 17 00:00:00 2001
+From: Jussi Pakkanen <jussi.pakkanen@mailbox.org>
+Date: Fri, 29 Aug 2025 14:57:06 +0300
+Subject: [PATCH] Check for header only Boost libraries.
+
+Upstream-Status: Backport [https://github.com/mesonbuild/meson/commit/6a9a=
81619c139d0f6ae3d265f7366e61615d92a1]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ mesonbuild/dependencies/boost.py | 22 ++++++++++++++++++++--
+ 1 file changed, 20 insertions(+), 2 deletions(-)
+
+diff --git a/mesonbuild/dependencies/boost.py b/mesonbuild/dependencies/bo=
ost.py
+index 662f985..e153e8f 100644
+--- a/mesonbuild/dependencies/boost.py
++++ b/mesonbuild/dependencies/boost.py
+@@ -452,6 +452,10 @@ class BoostDependency(SystemDependency):
+                 break
+         libs =3D sorted(set(libs))
+=20
++        any_libs_found =3D len(libs) > 0
++        if not any_libs_found:
++            return False
++
+         modules =3D ['boost_' + x for x in self.modules]
+         for inc in inc_dirs:
+             mlog.debug(f'  - found boost {inc.version} include dir: {inc.=
path}')
+@@ -462,7 +466,7 @@ class BoostDependency(SystemDependency):
+                 mlog.debug(f'    - {j}')
+=20
+             #   3. Select the libraries matching the requested modules
+-            not_found: T.List[str] =3D []
++            not_found_as_libs: T.List[str] =3D []
+             selected_modules: T.List[BoostLibraryFile] =3D []
+             for mod in modules:
+                 found =3D False
+@@ -472,7 +476,21 @@ class BoostDependency(SystemDependency):
+                         found =3D True
+                         break
+                 if not found:
+-                    not_found +=3D [mod]
++                    not_found_as_libs +=3D [mod]
++
++            # If a lib is not found, but an include directory exists,
++            # assume it is a header only module.
++            not_found: T.List[str] =3D []
++            for boost_modulename in not_found_as_libs:
++                assert boost_modulename.startswith('boost_')
++                include_subdir =3D boost_modulename.replace('boost_', 'bo=
ost/', 1)
++                headerdir_found =3D False
++                for inc_dir in inc_dirs:
++                    if (inc_dir.path / include_subdir).is_dir():
++                        headerdir_found =3D True
++                        break
++                if not headerdir_found:
++                    not_found.append(boost_modulename)
+=20
+             # log the result
+             mlog.debug('  - found:')
diff --git a/meta/recipes-devtools/meson/meson/0002-Boost-python-must-have-=
a-library-component.patch b/meta/recipes-devtools/meson/meson/0002-Boost-py=
thon-must-have-a-library-component.patch
new file mode 100644
index 0000000000..c03c47534e
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0002-Boost-python-must-have-a-libra=
ry-component.patch
@@ -0,0 +1,34 @@
+From d0644d543f4df39cf2ba14337000ee019cb20b6d Mon Sep 17 00:00:00 2001
+From: Jussi Pakkanen <jussi.pakkanen@mailbox.org>
+Date: Fri, 29 Aug 2025 22:51:48 +0300
+Subject: [PATCH] Boost python must have a library component.
+
+Upstream-Status: Backport [https://github.com/mesonbuild/meson/commit/8091=
7ca8c1a5af499cc6e004ad5d5a050da9045e]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ mesonbuild/dependencies/boost.py | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/mesonbuild/dependencies/boost.py b/mesonbuild/dependencies/bo=
ost.py
+index e153e8f..fdb35d4 100644
+--- a/mesonbuild/dependencies/boost.py
++++ b/mesonbuild/dependencies/boost.py
+@@ -440,6 +440,8 @@ class BoostDependency(SystemDependency):
+         mlog.debug('  - potential library dirs: {}'.format([x.as_posix() =
for x in lib_dirs]))
+         mlog.debug('  - potential include dirs: {}'.format([x.path.as_pos=
ix() for x in inc_dirs]))
+=20
++        must_have_library =3D ['boost_python']
++
+         #   2. Find all boost libraries
+         libs: T.List[BoostLibraryFile] =3D []
+         for i in lib_dirs:
+@@ -483,6 +485,9 @@ class BoostDependency(SystemDependency):
+             not_found: T.List[str] =3D []
+             for boost_modulename in not_found_as_libs:
+                 assert boost_modulename.startswith('boost_')
++                if boost_modulename in must_have_library:
++                    not_found.append(boost_modulename)
++                    continue
+                 include_subdir =3D boost_modulename.replace('boost_', 'bo=
ost/', 1)
+                 headerdir_found =3D False
+                 for inc_dir in inc_dirs:
diff --git a/meta/recipes-devtools/meson/meson_1.8.2.bb b/meta/recipes-devt=
ools/meson/meson_1.8.2.bb
index bfeaab0a79..0dd0544e14 100644
--- a/meta/recipes-devtools/meson/meson_1.8.2.bb
+++ b/meta/recipes-devtools/meson/meson_1.8.2.bb
@@ -14,6 +14,8 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/meson-${PV=
}.tar.gz \
            file://0001-python-module-do-not-manipulate-the-environment-whe=
n.patch \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
+           file://0001-Check-for-header-only-Boost-libraries.patch \
+           file://0002-Boost-python-must-have-a-library-component.patch \
            "
 SRC_URI[sha256sum] =3D "c105816d8158c76b72adcb9ff60297719096da7d07f6b1f000=
fd8c013cd387af"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)$"

