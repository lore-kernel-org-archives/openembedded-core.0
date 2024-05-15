Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 281C5C25B78
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 22:35:16 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.85])
 by mx.groups.io with SMTP id smtpd.web10.7725.1715812511009003871
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 15:35:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=FwEYCFgN;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.241.85, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Onsy3WlhxP2KrM9Dzi/b3j2fOK2v7r91q+mgXMTuOIX4VpMjKqaus99RJgQEcr7f7i/PuCp6Dy4tFg0Niw1Hq5LngGWFglw7CrJUlzRbvDhRTi3ogQRoxy9Ro2yt3YkaQxKFbgFWXn4zyieinM9tiw8+as30iHIuZU8SGfhVJRBVEOEBcTObI9FFCFrVTBIG6xwLMjM+MSCfK+0ASvFi5/o7iQDYPTUXJ4xjhulKjBz+ydb/JIbtl/xJRtubRxBWNmMq789VCk7E6xQOZsQFeOsjzyJqBsxPfyfuJh6Dxxg6ScW9ucfNUsLi1CakHHZ4KFC5nZUxfCb79m2kZaKNZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t8CBZruAeNdLQRZN3ez2kMqAedjjzzO2d+8sMYhGfnw=;
 b=J2WzkxdVUHPOhpS/E7bRuSr3ET+4VGqd6G1797HOPCzjKWCEvzPAq/PhfpfhQ+wi9bQ8hpvnk7duWqZqq2AwSdaXnpNxPWCnARPt+fGC+4CnVOho2pIjhXFuACdDjp0lC0wZbpMuKXLWfZfEXyqjF7FvCIQn4Vzc468jSoyAJA+Zfve+k3ZZalqJ4y+hfZFdKqH/+oHnboH4Oh+SbhBQVOjjf0Y5ouYbyeU2zes8GOVFXi/xWUTYV801W4KULyrdJ4Kv9czNDZI9l359AmtC+YYLG/qp6Bv01K7s4r2PA8Y8uYdQsOkEU1XiUmzhaHzR9Goz1PWR3ttxtDNPjE37Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8CBZruAeNdLQRZN3ez2kMqAedjjzzO2d+8sMYhGfnw=;
 b=FwEYCFgNBsvL5Bbg+4D9MVVr+apSPghhsIb32AkuNAt7uz/dnBecBrmUFhr32+6zU36QqxQJ5OGl5p3Q9lmYbiS5Q/6duC/czWUzHcpzgm/AwEiWq3RKCZvDZj7uEUV9uIWVM+NvNp0EAJQ5ur1koK47FikiOTr8sIwYYdIszlk=
Received: from AS9PR06CA0536.eurprd06.prod.outlook.com (2603:10a6:20b:49d::35)
 by AM8PR06MB7026.eurprd06.prod.outlook.com (2603:10a6:20b:1de::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Wed, 15 May
 2024 22:35:06 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:20b:49d:cafe::4b) by AS9PR06CA0536.outlook.office365.com
 (2603:10a6:20b:49d::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26 via Frontend
 Transport; Wed, 15 May 2024 22:35:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.21 via Frontend Transport; Wed, 15 May 2024 22:35:06 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 16 May 2024 00:35:04 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	alexandre.belloni@bootlin.com
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v9 1/3] image.bbclass/rootfs: archive and deploy package database
Date: Thu, 16 May 2024 00:34:58 +0200
Message-ID: <20240515223500.3464486-2-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515223500.3464486-1-johannes.schneider@leica-geosystems.com>
References: <20240515223500.3464486-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 15 May 2024 22:35:04.0164 (UTC) FILETIME=[215CE240:01DAA718]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AB:EE_|AM8PR06MB7026:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7c4471d2-1620-4e30-71f6-08dc752f4541
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|82310400017|1800799015|36860700004;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MqfBgy1TCUF85s7o+55DCF6nLw5YPAy/qAgWAHtnBFUw/WalxGi3cDGucMqx?=
 =?us-ascii?Q?JVEsgDaGEff1GLuYQt7YETGQa+4+c5EaTUAUlxq5mEGrpZm9+CIu5ch3c+1w?=
 =?us-ascii?Q?ZgNUE7gkUR+AcWlZfLaVRm6Mi42XE1H0Bt4FgHOsWXadMeTIXaCVVgMNkJ3h?=
 =?us-ascii?Q?XTwuhwCP6NoKCJD1otXEtha7OmGwu/vdJCTnRlncfhqY8bFkodZ27ayQV2ua?=
 =?us-ascii?Q?qkzcUQcQPYCa0chxbWYYSfTv8d1d7QW2dLthJ8qucilARFW/HrUe2VaJPUvq?=
 =?us-ascii?Q?rP5qUenwszCaq1LxOJj3fIJuAEg9CHt9j5Gu1fpRxXg5lArgSqLPPo7Xv5AM?=
 =?us-ascii?Q?HqBPW8pWms2WpM9fCoJOUM1SThpTN+ruL1DZZcPidprJ6mh4eI7ouFfa6wLS?=
 =?us-ascii?Q?7IshJYs8GQ5bV488GNAaNkP/x2HAiHkleThTVyOZfWsvz7YUjrpOSCJ+linu?=
 =?us-ascii?Q?6Jz6mbLo69bDdXHO8jh4yh/JPoDxPWEMoT6fulBF7byliYhhiSvmhFI2Qjab?=
 =?us-ascii?Q?+6zhRpkdlC6IG6IRhIwkGzSbkJ2xlWYbVHkVs+yU/k7/z/iobUXIa1PsDMjV?=
 =?us-ascii?Q?YdpBzD3ALRQicMMwpL6vLJ/zYLRMUsPt5MeiOZkj3jeSc625Eo5LNDKNh85o?=
 =?us-ascii?Q?0sKsMmTgiRxqyGoEu/qS2gcroRYOgfWceKRU8/e3+p4T7sRAqn9/VN0kHc3c?=
 =?us-ascii?Q?GyxlxAeFPMtVml2xV1ye4L+b4/pLSoMg+eU9brG0O90iu346dKb1yJNjWIhu?=
 =?us-ascii?Q?XFk2BH+duaWgbleea3UDgdQNu28uIQTdsqwurQjaVR9j9wgs3IoRIsM0OLln?=
 =?us-ascii?Q?xb0WeOLe/Cf4daztmmfEJ3RTek250irxCT+0xS5Qu5fXUVCfCqi2vpiTt6nM?=
 =?us-ascii?Q?vnK0CywbDt3PZaS6tJze6/OqAt7ilhRcvtZ2Q9vqar/DXpSY4bfoL5fPAq7+?=
 =?us-ascii?Q?FVI9OxsnJcbzmQpUu7mgS5jzdyEc4ddVB7bFrFVCo35bLh0zE+Iz/QAA8t2o?=
 =?us-ascii?Q?6MjVatq5iV5RK5miUMx8Mu/8Q2dTaWnTO/2edzrxCG/mjI+avLLBhk15nbE7?=
 =?us-ascii?Q?jEPaPotwvk3TYkZb/X0cjDctOGMFA+WlhC8+7nnampDt0N3hPbFu9Qh2b2CI?=
 =?us-ascii?Q?qwXUlDfHCeQ9eXQriizYJzZgPzoZduy7KBk8uA+oFOko0paq1Nd+eZ3MUi79?=
 =?us-ascii?Q?un5AkG8+kSYJ5EV6M6/Bg1Vsl/UtYqV5yvU+HHSRbgQHVYZKKRJVzJedMhEQ?=
 =?us-ascii?Q?PueCGfk3nTjFOwIy0X1oZSscvKd+YdRpMfzWWo/WHrSG07H31k5kIsKS9ewo?=
 =?us-ascii?Q?xl/ZRv5JqrPu48kYxuQcJot6?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(376005)(82310400017)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 22:35:06.5128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4471d2-1620-4e30-71f6-08dc752f4541
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 22:35:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199432

archive the package database after the rootfs has been put together as
*rootfs-pkdbfs.tar.gz, and put it into the deploy folder.

This creates a snapshot of the package mangers state at the point in
time when all dependencies have been resolved and installed; which
could be used by "extension images" to built upon.

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta/classes-recipe/image.bbclass             |  44 ++++-
 meta/classes-recipe/image_types.bbclass       |   1 +
 meta/conf/documentation.conf                  |   1 +
 meta/lib/oe/package_manager/deb/rootfs.py     |   1 +
 meta/lib/oe/package_manager/ipk/rootfs.py     |   1 +
 meta/lib/oe/package_manager/rpm/rootfs.py     |   1 +
 meta/lib/oe/rootfs.py                         |  20 +++
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 159 ++++++++++++++++++
 8 files changed, 227 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.=
bbclass
index 28be6c6362..3ccaaa17b8 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -42,6 +42,9 @@ IMAGE_FEATURES ?=3D ""
 IMAGE_FEATURES[type] =3D "list"
 IMAGE_FEATURES[validitems] +=3D "debug-tweaks read-only-rootfs read-only-r=
ootfs-delayed-postinsts stateless-rootfs empty-root-password allow-empty-pa=
ssword allow-root-login serial-autologin-root post-install-logging overlayf=
s-etc"
=20
+# Generate snapshot of the package database?
+IMAGE_GEN_PKGDBFS ?=3D "0"
+
 # Generate companion debugfs?
 IMAGE_GEN_DEBUGFS ?=3D "0"
=20
@@ -131,7 +134,8 @@ def rootfs_variables(d):
                  'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IM=
AGE_MANIFEST','DEPLOY_DIR_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTA=
RY','IMAGE_LINGUAS', 'IMAGE_LINGUAS_COMPLEMENTARY', 'IMAGE_LOCALES_ARCHIVE'=
,
                  'MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS','MULTILIB_V=
ARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS=
','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS',
                  'PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VENDOR','TARGET=
_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI',=
'INTERCEPT_DIR','USE_DEVFS',
-                 'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEED=
ED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY', 'REPRODUCIBLE_TIMESTA=
MP_ROOTFS', 'IMAGE_INSTALL_DEBUGFS']
+                 'CONVERSIONTYPES', 'IMAGE_GEN_PKGDBFS', 'IMAGE_GEN_DEBUGF=
S', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY', =
'REPRODUCIBLE_TIMESTAMP_ROOTFS',
+                 'IMAGE_INSTALL_DEBUGFS']
     variables.extend(rootfs_command_variables(d))
     variables.extend(variable_depends(d))
     return " ".join(variables)
@@ -337,6 +341,17 @@ python do_image_qa_setscene () {
 }
 addtask do_image_qa_setscene
=20
+def setup_pkgdbfs_variables(d):
+    d.appendVar('IMAGE_ROOTFS', '-pkgdb')
+    if d.getVar('IMAGE_LINK_NAME'):
+        d.appendVar('IMAGE_LINK_NAME', '-pkgdb')
+    d.appendVar('IMAGE_NAME','-pkgdb')
+    d.setVar('IMAGE_FSTYPES', 'tar.gz')
+
+python setup_pkgdbfs () {
+    setup_pkgdbfs_variables(d)
+}
+
 def setup_debugfs_variables(d):
     d.appendVar('IMAGE_ROOTFS', '-dbg')
     if d.getVar('IMAGE_LINK_NAME'):
@@ -381,6 +396,11 @@ python () {
     alltypes =3D d.getVar('IMAGE_FSTYPES').split()
     typedeps =3D {}
=20
+    if d.getVar('IMAGE_GEN_PKGDBFS') =3D=3D "1":
+        pkgdbfs_fstypes =3D ['tar.gz']
+        for t in pkgdbfs_fstypes:
+            alltypes.append("pkgdbfs_" + t)
+
     if d.getVar('IMAGE_GEN_DEBUGFS') =3D=3D "1":
         debugfs_fstypes =3D d.getVar('IMAGE_FSTYPES_DEBUGFS').split()
         for t in debugfs_fstypes:
@@ -393,6 +413,10 @@ python () {
             basetypes[baset]=3D []
         if t not in basetypes[baset]:
             basetypes[baset].append(t)
+        pkgdb =3D ""
+        if t.startswith("pkgdbfs_"):
+            t =3D t[8:]
+            pkgdb =3D "pkgdbfs_"
         debug =3D ""
         if t.startswith("debugfs_"):
             t =3D t[8:]
@@ -401,6 +425,13 @@ python () {
         vardeps.add('IMAGE_TYPEDEP:' + t)
         if baset not in typedeps:
             typedeps[baset] =3D set()
+        deps =3D [pkgdb + dep for dep in deps]
+        for dep in deps:
+            if dep not in alltypes:
+                alltypes.append(dep)
+            _add_type(dep)
+            basedep =3D _image_base_type(dep)
+            typedeps[baset].add(basedep)
         deps =3D [debug + dep for dep in deps]
         for dep in deps:
             if dep not in alltypes:
@@ -419,6 +450,7 @@ python () {
=20
     maskedtypes =3D (d.getVar('IMAGE_TYPES_MASKED') or "").split()
     maskedtypes =3D [dbg + t for t in maskedtypes for dbg in ("", "debugfs=
_")]
+    maskedtypes =3D [pkgdb + t for t in maskedtypes for pkgdb in ("", "pkg=
dbfs_")]
=20
     for t in basetypes:
         vardeps =3D set()
@@ -430,6 +462,11 @@ python () {
             continue
=20
         localdata =3D bb.data.createCopy(d)
+        pkgdb =3D ""
+        if t.startswith("pkgdbfs_"):
+            setup_pkgdbfs_variables(localdata)
+            pkgdb =3D "setup_pkgdbfs "
+            realt =3D t[8:]
         debug =3D ""
         if t.startswith("debugfs_"):
             setup_debugfs_variables(localdata)
@@ -468,6 +505,8 @@ python () {
             for ctype in sorted(ctypes):
                 if bt.endswith("." + ctype):
                     type =3D bt[0:-len(ctype) - 1]
+                    if type.startswith("pkgdbfs_"):
+                        type =3D type[8:]
                     if type.startswith("debugfs_"):
                         type =3D type[8:]
                     # Create input image first.
@@ -509,6 +548,9 @@ python () {
         d.setVarFlag(task, 'fakeroot', '1')
=20
         d.appendVarFlag(task, 'prefuncs', ' ' + debug + ' set_image_size')
+        if pkgdb:
+            d.appendVarFlag(task, 'prefuncs', ' ' + pkgdb + ' set_image_si=
ze')
+
         d.prependVarFlag(task, 'postfuncs', 'create_symlinks ')
         d.appendVarFlag(task, 'subimages', ' ' + ' '.join(subimages))
         d.appendVarFlag(task, 'vardeps', ' ' + ' '.join(vardeps))
diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/=
image_types.bbclass
index b4a83ae284..602fc26ac3 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -25,6 +25,7 @@ def imagetypes_getdepends(d):
=20
     fstypes =3D set((d.getVar('IMAGE_FSTYPES') or "").split())
     fstypes |=3D set((d.getVar('IMAGE_FSTYPES_DEBUGFS') or "").split())
+    fstypes |=3D set('tar.gz') # hardcoded for 'pkgdbfs'
=20
     deprecated =3D set()
     deps =3D set()
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index b0591881ba..36aebb59ab 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -215,6 +215,7 @@ IMAGE_FEATURES[doc] =3D "The primary list of features t=
o include in an image. Conf
 IMAGE_FSTYPES[doc] =3D "Formats of root filesystem images that you want to=
 have created."
 IMAGE_FSTYPES_DEBUGFS[doc] =3D "Formats of the debug root filesystem image=
s that you want to have created."
 IMAGE_GEN_DEBUGFS[doc] =3D "When set to '1', generate a companion debug ob=
ject/source filesystem image."
+IMAGE_GEN_PKGDBFS[doc] =3D "When set to '1', create a snapshot of the pack=
age-manager state after the rootfs has been assembled."
 IMAGE_INSTALL[doc] =3D "Specifies the packages to install into an image. I=
mage recipes set IMAGE_INSTALL to specify the packages to install into an i=
mage through image.bbclass."
 IMAGE_LINGUAS[doc] =3D "Specifies the list of locales to install into the =
image during the root filesystem construction process."
 IMAGE_NAME[doc] =3D "The name of the output image files minus the extensio=
n."
diff --git a/meta/lib/oe/package_manager/deb/rootfs.py b/meta/lib/oe/packag=
e_manager/deb/rootfs.py
index 1e25b64ed9..43107c8663 100644
--- a/meta/lib/oe/package_manager/deb/rootfs.py
+++ b/meta/lib/oe/package_manager/deb/rootfs.py
@@ -178,6 +178,7 @@ class PkgRootfs(DpkgOpkgRootfs):
         if self.progress_reporter:
             self.progress_reporter.next_stage()
=20
+        self._setup_pkg_db_rootfs(['/var/lib/dpkg'])
         self._setup_dbg_rootfs(['/var/lib/dpkg'])
=20
         self.pm.fix_broken_dependencies()
diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/packag=
e_manager/ipk/rootfs.py
index ba93eb62ea..64d9bc7969 100644
--- a/meta/lib/oe/package_manager/ipk/rootfs.py
+++ b/meta/lib/oe/package_manager/ipk/rootfs.py
@@ -319,6 +319,7 @@ class PkgRootfs(DpkgOpkgRootfs):
=20
         opkg_lib_dir =3D self.d.getVar('OPKGLIBDIR')
         opkg_dir =3D os.path.join(opkg_lib_dir, 'opkg')
+        self._setup_pkg_db_rootfs([opkg_dir])
         self._setup_dbg_rootfs([opkg_dir])
=20
         execute_pre_post_process(self.d, opkg_post_process_cmds)
diff --git a/meta/lib/oe/package_manager/rpm/rootfs.py b/meta/lib/oe/packag=
e_manager/rpm/rootfs.py
index 3ba5396320..673006c131 100644
--- a/meta/lib/oe/package_manager/rpm/rootfs.py
+++ b/meta/lib/oe/package_manager/rpm/rootfs.py
@@ -110,6 +110,7 @@ class PkgRootfs(Rootfs):
         if self.progress_reporter:
             self.progress_reporter.next_stage()
=20
+        self._setup_pkg_db_rootfs(['/etc/rpm', '/etc/rpmrc', '/etc/dnf', '=
/var/lib/rpm', '/var/cache/dnf', '/var/lib/dnf'])
         self._setup_dbg_rootfs(['/etc/rpm', '/etc/rpmrc', '/etc/dnf', '/va=
r/lib/rpm', '/var/cache/dnf', '/var/lib/dnf'])
=20
         execute_pre_post_process(self.d, rpm_post_process_cmds)
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 8cd48f9450..6d6e888a30 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -106,6 +106,26 @@ class Rootfs(object, metaclass=3DABCMeta):
     def _cleanup(self):
         pass
=20
+    def _setup_pkg_db_rootfs(self, package_paths):
+        gen_pkg_db_fs =3D bb.utils.to_boolean(self.d.getVar('IMAGE_GEN_PKG=
DBFS'))
+        if not gen_pkg_db_fs:
+           return
+
+        bb.note("  Creating pkg-db rootfs...")
+        try:
+            shutil.rmtree(self.image_rootfs + '-pkgdb')
+        except (FileNotFoundError, NotADirectoryError):
+            pass
+        bb.utils.mkdirhier(self.image_rootfs + "-pkgdb")
+
+        bb.note("  Copying back package database...")
+        for path in package_paths:
+            bb.utils.mkdirhier(self.image_rootfs + os.path.dirname(path))
+            if os.path.isdir(self.image_rootfs + path):
+                shutil.copytree(self.image_rootfs + path, self.image_rootf=
s + '-pkgdb' + path, symlinks=3DTrue)
+            elif os.path.isfile(self.image_rootfs + path):
+                shutil.copyfile(self.image_rootfs + path, self.image_rootf=
s + '-pkgdb' + path)
+
     def _setup_dbg_rootfs(self, package_paths):
         gen_debugfs =3D self.d.getVar('IMAGE_GEN_DEBUGFS') or '0'
         if gen_debugfs !=3D '1':
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/=
selftest/cases/imagefeatures.py
index dc88c222bd..6724bac0e4 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -302,6 +302,165 @@ SKIP_RECIPE[busybox] =3D "Don't build this"
             result =3D runCmd('objdump --syms %s | grep debug' % t)
             self.assertTrue("debug" in result.output, msg=3D'Failed to fin=
d debug symbol: %s' % result.output)
=20
+    def test_image_gen_pkgdbfs_ipk(self):
+        """
+        Summary:     Check pkgdb snapshot
+        Expected:    1. core-image-minimal can be build with IMAGE_GEN_PKG=
DBFS variable set
+                     2. *rootfs-pkgdb.tar.gz snapshot of the package manag=
er state is created,
+                        after the rootfs of the core-image-minimal is put =
together
+                     3. check that the restored package index is usable by=
 the default packagemanager
+                        PACKAGE_CLASS=3Dpackage_ipk -> opkg in this case.
+        """
+
+        image =3D 'core-image-minimal'
+        features =3D 'IMAGE_GEN_PKGDBFS =3D "1"\n'
+        features +=3D 'PACKAGE_CLASSES =3D "package_ipk"\n'
+        self.write_config(features)
+
+        # forcing the regeneration of the rootfs to have an up-to-date pac=
kage index
+        # then creating the backup =3D pkgdbfs
+        # and finally forcing the deploy step, to have the pkgdb.tar.gz av=
ailable in the DEPLOY_DIR_IMAGE
+        bitbake(image + ' -c rootfs -f -c image_pkgdbfs_tar -f -c image_co=
mplete -f')
+
+        img_vars =3D get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME', '=
MACHINE', 'DEFAULTTUNE'], image)
+
+        tar_file =3D os.path.join(img_vars['DEPLOY_DIR_IMAGE'], "%s-pkgdb.=
tar.gz" % (img_vars['IMAGE_LINK_NAME']))
+        self.assertTrue(os.path.exists(tar_file), 'pkgdb filesystem not ge=
nerated at %s' % tar_file)
+        result =3D runCmd('cd %s; tar xvf %s' % (img_vars['DEPLOY_DIR_IMAG=
E'], tar_file))
+        self.assertEqual(result.status, 0, msg=3D'Failed to extract %s: %s=
' % (tar_file, result.output))
+        self.assertTrue(os.path.exists(os.path.join(img_vars['DEPLOY_DIR_I=
MAGE'], 'var/lib/opkg/status')), 'opkg\'s status file was not present in: %=
s' % tar_file)
+
+        bitbake("opkg-native")
+        bitbake("build-sysroots -c build_native_sysroot")
+
+        native_vars =3D get_bb_vars(["STAGING_DIR", "BUILD_ARCH", "bindir_=
native", "libdir_native"])
+        stagingbindir =3D os.path.join(native_vars["STAGING_DIR"], native_=
vars["BUILD_ARCH"], native_vars["bindir_native"].lstrip(os.sep))
+
+        # some 'add-arch' have '-' replaced by '_', some not; adding both =
does not hurt
+        cmd =3D os.path.join(stagingbindir, 'opkg') + \
+            ' --volatile-cache --offline-root=3D%s --add-arch %s:11 --add-=
arch %s:12 list-installed' \
+            % (img_vars['DEPLOY_DIR_IMAGE'], img_vars["MACHINE"], img_vars=
["MACHINE"].replace('-','_'))
+        self.logger.debug('running cmd: %s' % cmd)
+        result =3D runCmd(cmd)
+        self.logger.debug("list-installed:\n%s" % result.output)
+        self.assertEqual(result.status, 0, msg=3D'Failed to run package ma=
nager on unpacked pkgdb %s: %s' % (tar_file, result.output))
+        # check for a 'random, very architecture specific' package
+        if 'qemux86' in img_vars['MACHINE']:
+            self.assertTrue("kernel-image" in result.output, msg=3D'Failed=
 query installed packages')
+        if 'qemuarm' in img_vars['MACHINE']:
+            self.assertTrue("core-boot" in result.output, msg=3D'Failed qu=
ery installed packages')
+
+        cmd =3D os.path.join(stagingbindir, 'opkg') + \
+            ' --volatile-cache --offline-root=3D%s --add-arch %s:11 --add-=
arch %s:12 list-installed' \
+            % (img_vars['DEPLOY_DIR_IMAGE'], img_vars["DEFAULTTUNE"], img_=
vars["DEFAULTTUNE"].replace('-','_'))
+        self.logger.debug('running cmd: %s' % cmd)
+        result =3D runCmd(cmd)
+        self.logger.debug("list-installed:\n%s" % result.output)
+        self.assertEqual(result.status, 0, msg=3D'Failed to run package ma=
nager on unpacked pkgdb %s: %s' % (tar_file, result.output))
+        # check for a common base package, a random library for example:
+        self.assertTrue("libc6" in result.output, msg=3D'Failed query inst=
alled packages')
+
+    def test_image_gen_pkgdbfs_deb(self):
+        """
+        Summary:     Check pkgdb snapshot
+        Expected:    1. core-image-minimal can be build with IMAGE_GEN_PKG=
DBFS variable set
+                     2. *rootfs-pkgdb.tar.gz snapshot of the package manag=
er state is created,
+                        after the rootfs of the core-image-minimal is put =
together
+                     3. check that the restored package index is usable by=
 the packagemanager
+                        PACKAGE_CLASS=3Dpackage_deb -> dpkg in this case.
+        """
+
+        image =3D 'core-image-minimal'
+        features =3D 'IMAGE_GEN_PKGDBFS =3D "1"\n'
+        features +=3D 'PACKAGE_CLASSES =3D "package_deb"\n'
+        self.write_config(features)
+
+        # forcing the regeneration of the rootfs to have an up-to-date pac=
kage index
+        # then creating the backup =3D pkgdbfs
+        # and finally forcing the deploy step, to have the pkgdb.tar.gz av=
ailable in the DEPLOY_DIR_IMAGE
+        bitbake(image + ' -c rootfs -f -c image_pkgdbfs_tar -f -c image_co=
mplete -f')
+
+        img_vars =3D get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME', '=
MACHINE', 'DEFAULTTUNE'], image)
+
+        tar_file =3D os.path.join(img_vars['DEPLOY_DIR_IMAGE'], "%s-pkgdb.=
tar.gz" % (img_vars['IMAGE_LINK_NAME']))
+        self.assertTrue(os.path.exists(tar_file), 'pkgdb filesystem not ge=
nerated at %s' % tar_file)
+        result =3D runCmd('cd %s; tar xvf %s' % (img_vars['DEPLOY_DIR_IMAG=
E'], tar_file))
+        self.assertEqual(result.status, 0, msg=3D'Failed to extract %s: %s=
' % (tar_file, result.output))
+        self.assertTrue(os.path.exists(os.path.join(img_vars['DEPLOY_DIR_I=
MAGE'], 'var/lib/dpkg/status')), 'dpkg\'s status file was not present in: %=
s' % tar_file)
+
+        bitbake("dpkg-native")
+        bitbake("build-sysroots -c build_native_sysroot")
+
+        native_vars =3D get_bb_vars(["STAGING_DIR", "BUILD_ARCH", "bindir_=
native", "libdir_native"])
+        stagingbindir =3D os.path.join(native_vars["STAGING_DIR"], native_=
vars["BUILD_ARCH"], native_vars["bindir_native"].lstrip(os.sep))
+
+        cmd =3D os.path.join(stagingbindir, 'dpkg') + \
+            ' --admindir=3D%s/var/lib/dpkg --get-selections' \
+            % (img_vars['DEPLOY_DIR_IMAGE'])
+        self.logger.debug('running cmd: %s' % cmd)
+        result =3D runCmd(cmd)
+        self.logger.debug("list-installed:\n%s" % result.output)
+        self.assertEqual(result.status, 0, msg=3D'Failed to run package ma=
nager on unpacked pkgdb %s: %s' % (tar_file, result.output))
+
+        # check for a 'random, very architecture specific' package
+        if 'qemux86' in img_vars['MACHINE']:
+            self.assertTrue("kernel-image" in result.output, msg=3D'Failed=
 query installed packages')
+        if 'qemuarm' in img_vars['MACHINE']:
+            self.assertTrue("core-boot" in result.output, msg=3D'Failed qu=
ery installed packages')
+        # check for a common base package, a random library for example:
+        self.assertTrue("libc6" in result.output, msg=3D'Failed query inst=
alled packages')
+
+    def test_image_gen_pkgdbfs_rpm(self):
+        """
+        Summary:     Check pkgdb snapshot
+        Expected:    1. core-image-minimal can be build with IMAGE_GEN_PKG=
DBFS variable set
+                     2. *rootfs-pkgdb.tar.gz snapshot of the package manag=
er state is created,
+                        after the rootfs of the core-image-minimal is put =
together
+                     3. check that the restored package index is usable by=
 the packagemanager
+                        PACKAGE_CLASS=3Dpackage_rpm -> dnf in this case.
+        """
+
+        image =3D 'core-image-minimal'
+        features =3D 'IMAGE_GEN_PKGDBFS =3D "1"\n'
+        features +=3D 'PACKAGE_CLASSES =3D "package_rpm"\n'
+        self.write_config(features)
+
+        # forcing the regeneration of the rootfs to have an up-to-date pac=
kage index
+        # then creating the backup =3D pkgdbfs
+        # and finally forcing the deploy step, to have the pkgdb.tar.gz av=
ailable in the DEPLOY_DIR_IMAGE
+        bitbake(image + ' -c rootfs -f -c image_pkgdbfs_tar -f -c image_co=
mplete -f')
+
+        img_vars =3D get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME', '=
MACHINE', 'DEFAULTTUNE'], image)
+
+        tar_file =3D os.path.join(img_vars['DEPLOY_DIR_IMAGE'], "%s-pkgdb.=
tar.gz" % (img_vars['IMAGE_LINK_NAME']))
+        self.assertTrue(os.path.exists(tar_file), 'pkgdb filesystem not ge=
nerated at %s' % tar_file)
+        result =3D runCmd('cd %s; tar xvf %s' % (img_vars['DEPLOY_DIR_IMAG=
E'], tar_file))
+        self.assertEqual(result.status, 0, msg=3D'Failed to extract %s: %s=
' % (tar_file, result.output))
+        self.assertTrue(os.path.exists(os.path.join(img_vars['DEPLOY_DIR_I=
MAGE'], 'var/lib/rpm/rpmdb.sqlite')), 'rpms\'s database file was not presen=
t in: %s' % tar_file)
+
+        bitbake("rpm-native")
+        bitbake("build-sysroots -c build_native_sysroot")
+
+        native_vars =3D get_bb_vars(["STAGING_DIR", "BUILD_ARCH", "bindir_=
native", "libdir_native"])
+        stagingbindir =3D os.path.join(native_vars["STAGING_DIR"], native_=
vars["BUILD_ARCH"], native_vars["bindir_native"].lstrip(os.sep))
+
+        # some 'add-arch' have '-' replaced by '_', some not; adding both =
does not hurt
+        cmd =3D os.path.join(stagingbindir, 'rpm') + \
+            ' --dbpath=3D%s/var/lib/rpm/ --query --all' \
+            % (img_vars['DEPLOY_DIR_IMAGE'])
+        self.logger.debug('running cmd: %s' % cmd)
+        result =3D runCmd(cmd)
+        self.logger.debug("list-installed:\n%s" % result.output)
+        self.assertEqual(result.status, 0, msg=3D'Failed to run package ma=
nager on unpacked pkgdb %s: %s' % (tar_file, result.output))
+
+        # check for a 'random, very architecture specific' package
+        if 'qemux86' in img_vars['MACHINE']:
+            self.assertTrue("kernel-image" in result.output, msg=3D'Failed=
 query installed packages')
+        if 'qemuarm' in img_vars['MACHINE']:
+            self.assertTrue("core-boot" in result.output, msg=3D'Failed qu=
ery installed packages')
+        # check for a common base package, a random library for example:
+        self.assertTrue("libc6" in result.output, msg=3D'Failed query inst=
alled packages')
+
     def test_empty_image(self):
         """Test creation of image with no packages"""
         image =3D 'test-empty-image'
--=20
2.34.1


