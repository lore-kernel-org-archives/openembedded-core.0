Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E956C48BC3
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 08:57:33 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.54])
 by mx.groups.io with SMTP id smtpd.web11.7649.1707814644470151538
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 00:57:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=W4gCvmsh;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.14.54, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FgHWgiAMHTEi8AR+maxoGFW/ioovljU+lR5RvNHnTkOErdI9cK7zp6oTEofrrBOys8oZgZzdjc5JdbP76dT02De2tXmaH7fo13GiF1jVTBL7khq0OR621VpAm13JY7kPrk8BFlqi+GzeJhLlQ9A9i221575RsBs0cNXgb06yDaEgqalWslobrtv0rD72GK0Hhso+TFDM4KCskhHrzhKyDOxtnEWc2sUaxh9sRFJtxPPWyXrtTX/ZeiEr3uYCZEI1zbYx9joenSO4rHJ9r3toabM0r2gOiHpAaVpq7J06KMcy1+7ZiatBA0TOykBOT2LYly2ZUzWgnMdByIKOjTUJ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGTQTQpdi1TPEp8fIwgVP3l+SGVQ3LudWh+SNLQ51v0=;
 b=BTebsQ3wU0CySAA9faiikxzPx5mEcFDG/vGXVYdaCTPzXV63yQjkZ1xAfKcaSeEZuqc65wp1PcsmrqJOuofrbHc7FTeYa7SMrn2v6tkTDTcQ14XR4k57ZlBXYYuBZg3bEAZl4ee6q2hYmOVs9io4Q82M/3P2mcQlaBfeJdaFaQhORP6yyrD5Q3ldqcSx2tBGbahz97QNgA/edcdpTbWTn5z8iNRp36oE8wl67DwPcxypGp3LILrEsfgAc9QNPwJjvoOjfGuayyyYQzxm9NZAivae2f8S3n5oFEteKHUF+XQ7WC2ao3F5CpAzdSMlfL9FmlkwzIW0MtyqLRVBOL5fPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGTQTQpdi1TPEp8fIwgVP3l+SGVQ3LudWh+SNLQ51v0=;
 b=W4gCvmshOUkfybS9XBvpWSgJ9NZ3WTn10OvVepYH8Ui2ANdom6B4wJvToubAxE7GGz/chbyMzgGNPtWnBidxPxSKtsATvPdRDjMwsjFY0bQDPw6/+CYr4kWlUlmFMAOt3oQGjvWyiZsp4Wx1Q1Fsa56Q3b0fejoMA8CrJdVALew=
Received: from DB8PR04CA0013.eurprd04.prod.outlook.com (2603:10a6:10:110::23)
 by DB9PR06MB7419.eurprd06.prod.outlook.com (2603:10a6:10:260::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 08:57:20 +0000
Received: from DB5PEPF00014B95.eurprd02.prod.outlook.com
 (2603:10a6:10:110:cafe::14) by DB8PR04CA0013.outlook.office365.com
 (2603:10a6:10:110::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38 via Frontend
 Transport; Tue, 13 Feb 2024 08:57:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DB5PEPF00014B95.mail.protection.outlook.com (10.167.8.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 08:57:20 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 13 Feb 2024 09:57:20 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v1 1/3] image.bbclass/rootfs: archive and deploy opkg package database
Date: Tue, 13 Feb 2024 09:56:55 +0100
Message-ID: <20240213085658.170917-2-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213085658.170917-1-johannes.schneider@leica-geosystems.com>
References: <20240213085658.170917-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 13 Feb 2024 08:57:20.0093 (UTC) FILETIME=[A6E4C8D0:01DA5E5A]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B95:EE_|DB9PR06MB7419:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1405bebf-8e5b-418a-f383-08dc2c71c9a8
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WA4OGYhewVDrEC5s7SyEIcTi+51XkDLP1hYhfDZtA9Wq26h08oYEtAePTYJpdBO7byJVp14CCOsUoj2CDrVZUIEdG3uamF3vttTfBtDmFAgdSy+6wv8vTAxZv6S2eIuTNPK+lvSaGw1lPFcKqZaqi9vuK3gK0a+cAUNEAA75mTbRvfw5FX1s2UbjCuCMRhGhp6Qgvq4Ma0c4p4zQQlD+yde668OEHLbzGhpg4vXkF3FR0WXlsOeMcSLtJKGQ9ADORNJkAHEJ0VDnr4u6aHLT8q3Fh+Q7hOovV1geIX+FOPYAKPN+elSUaxn8XjpulH6VtyYB6e2phfEgD4WiiT3eZ3d6VwtFcNpU2bem7jhN+mqrw7mpb0PcaNYXqoyFTMUyGOVqC7TawCcKsIbyNoKeWdqFjV2EHcNaOUE4MRlP/2zuhgln+qtZulcCQqFQIkkjNOdEXQAk+fdad6tgg5mhlWL+HwkJsAARiRnu5S/ERxPDN9Hxta/In5NIYtWpKMi5V9Dwsmjn6VpLDOaSTNQBgEV0GwacmEQESVWQPLL3acY+IyBA1EQPDHCk4YDK5Lx3CXaS3R0kTn6Ad7RkvREh3w==
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(39860400002)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(82310400011)(36840700001)(46966006)(40470700004)(356005)(83380400001)(86362001)(81166007)(36756003)(82740400003)(2906002)(44832011)(5660300002)(70206006)(26005)(70586007)(316002)(6666004)(4326008)(6916009)(8676002)(8936002)(336012)(478600001)(41300700001)(1076003)(107886003)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 08:57:20.5362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1405bebf-8e5b-418a-f383-08dc2c71c9a8
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7419
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 08:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195373

archive the package database after the rootfs has been put together as
*rootfs-pkdbfs.tar.gz, and put it into the deploy folder.

This creates a snapshot of the package mangers state at the point in time w=
hen
all dependencies have been resolved and installed; which can be used by "fo=
llow
up" images to be built upon.

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta/classes/image.bbclass                | 44 +++++++++++++++++++++--
 meta/classes/image_types.bbclass          |  1 +
 meta/conf/bitbake.conf                    |  1 +
 meta/lib/oe/package_manager/deb/rootfs.py |  1 +
 meta/lib/oe/package_manager/ipk/rootfs.py |  1 +
 meta/lib/oe/package_manager/rpm/rootfs.py |  1 +
 meta/lib/oe/rootfs.py                     | 35 ++++++++++++++++++
 7 files changed, 82 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 00413d56d1..c8919a4857 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -36,6 +36,9 @@ IMAGE_FEATURES ?=3D ""
 IMAGE_FEATURES[type] =3D "list"
 IMAGE_FEATURES[validitems] +=3D "debug-tweaks read-only-rootfs read-only-r=
ootfs-delayed-postinsts stateless-rootfs empty-root-password allow-empty-pa=
ssword allow-root-login post-install-logging overlayfs-etc"
=20
+# Generate snapshot of the package database?
+IMAGE_GEN_PKGDBFS ?=3D "0"
+
 # Generate companion debugfs?
 IMAGE_GEN_DEBUGFS ?=3D "0"
=20
@@ -125,7 +128,7 @@ def rootfs_variables(d):
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
'REPRODUCIBLE_TIMESTAMP_ROOTFS', 'IMAGE_INSTALL_DEBUGFS']
     variables.extend(rootfs_command_variables(d))
     variables.extend(variable_depends(d))
     return " ".join(variables)
@@ -330,6 +333,19 @@ python do_image_qa_setscene () {
 }
 addtask do_image_qa_setscene
=20
+def setup_pkgdbfs_variables(d):
+    d.appendVar('IMAGE_ROOTFS', '-pkgdb')
+    if d.getVar('IMAGE_LINK_NAME'):
+        d.appendVar('IMAGE_LINK_NAME', '-pkgdb')
+    d.appendVar('IMAGE_NAME','-pkgdb')
+    pkgdbfs_image_fstypes =3D d.getVar('IMAGE_FSTYPES_PKGDBFS')
+    if pkgdbfs_image_fstypes:
+        d.setVar('IMAGE_FSTYPES', pkgdbfs_image_fstypes)
+
+python setup_pkgdbfs () {
+    setup_pkgdbfs_variables(d)
+}
+
 def setup_debugfs_variables(d):
     d.appendVar('IMAGE_ROOTFS', '-dbg')
     if d.getVar('IMAGE_LINK_NAME'):
@@ -374,6 +390,11 @@ python () {
     alltypes =3D d.getVar('IMAGE_FSTYPES').split()
     typedeps =3D {}
=20
+    if d.getVar('IMAGE_GEN_PKGDBFS') =3D=3D "1":
+        pkgdbfs_fstypes =3D d.getVar('IMAGE_FSTYPES_PKGDBFS').split()
+        for t in pkgdbfs_fstypes:
+            alltypes.append("pkgdbfs_" + t)
+
     if d.getVar('IMAGE_GEN_DEBUGFS') =3D=3D "1":
         debugfs_fstypes =3D d.getVar('IMAGE_FSTYPES_DEBUGFS').split()
         for t in debugfs_fstypes:
@@ -386,6 +407,10 @@ python () {
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
@@ -394,6 +419,13 @@ python () {
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
@@ -412,6 +444,7 @@ python () {
=20
     maskedtypes =3D (d.getVar('IMAGE_TYPES_MASKED') or "").split()
     maskedtypes =3D [dbg + t for t in maskedtypes for dbg in ("", "debugfs=
_")]
+    maskedtypes =3D [pkgdb + t for t in maskedtypes for pkgdb in ("", "pkg=
dbfs_")]
=20
     for t in basetypes:
         vardeps =3D set()
@@ -423,6 +456,11 @@ python () {
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
@@ -461,6 +499,8 @@ python () {
             for ctype in sorted(ctypes):
                 if bt.endswith("." + ctype):
                     type =3D bt[0:-len(ctype) - 1]
+                    if type.startswith("pkgdbfs_"):
+                        type =3D type[8:]
                     if type.startswith("debugfs_"):
                         type =3D type[8:]
                     # Create input image first.
@@ -501,7 +541,7 @@ python () {
         d.setVarFlag(task, 'func', '1')
         d.setVarFlag(task, 'fakeroot', '1')
=20
-        d.appendVarFlag(task, 'prefuncs', ' ' + debug + ' set_image_size')
+        d.appendVarFlag(task, 'prefuncs', ' ' + debug + pkgdb + ' set_imag=
e_size')
         d.prependVarFlag(task, 'postfuncs', 'create_symlinks ')
         d.appendVarFlag(task, 'subimages', ' ' + ' '.join(subimages))
         d.appendVarFlag(task, 'vardeps', ' ' + ' '.join(vardeps))
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bb=
class
index 9d5f8c68a4..cae8abd47e 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -19,6 +19,7 @@ def imagetypes_getdepends(d):
=20
     fstypes =3D set((d.getVar('IMAGE_FSTYPES') or "").split())
     fstypes |=3D set((d.getVar('IMAGE_FSTYPES_DEBUGFS') or "").split())
+    fstypes |=3D set((d.getVar('IMAGE_FSTYPES_PKGDBFS') or "").split())
=20
     deprecated =3D set()
     deps =3D set()
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 290dfda6c8..80607567c1 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -830,6 +830,7 @@ require conf/sanity.conf
 DL_DIR ?=3D "${TOPDIR}/downloads"
 SSTATE_DIR ?=3D "${TOPDIR}/sstate-cache"
 IMAGE_FSTYPES ?=3D "tar.gz"
+IMAGE_FSTYPES_PKGDBFS ?=3D "tar.gz"
 IMAGE_FSTYPES_DEBUGFS ?=3D "tar.gz"
=20
 INITRAMFS_FSTYPES ?=3D "cpio.gz"
diff --git a/meta/lib/oe/package_manager/deb/rootfs.py b/meta/lib/oe/packag=
e_manager/deb/rootfs.py
index 8fbaca11d6..08d8aa9813 100644
--- a/meta/lib/oe/package_manager/deb/rootfs.py
+++ b/meta/lib/oe/package_manager/deb/rootfs.py
@@ -176,6 +176,7 @@ class PkgRootfs(DpkgOpkgRootfs):
         if self.progress_reporter:
             self.progress_reporter.next_stage()
=20
+        self._setup_pkg_db_rootfs(['/var/lib/dpkg'])
         self._setup_dbg_rootfs(['/var/lib/dpkg'])
=20
         self.pm.fix_broken_dependencies()
diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/packag=
e_manager/ipk/rootfs.py
index 10a831994e..14bf6cac98 100644
--- a/meta/lib/oe/package_manager/ipk/rootfs.py
+++ b/meta/lib/oe/package_manager/ipk/rootfs.py
@@ -317,6 +317,7 @@ class PkgRootfs(DpkgOpkgRootfs):
=20
         opkg_lib_dir =3D self.d.getVar('OPKGLIBDIR')
         opkg_dir =3D os.path.join(opkg_lib_dir, 'opkg')
+        self._setup_pkg_db_rootfs([opkg_dir])
         self._setup_dbg_rootfs([opkg_dir])
=20
         execute_pre_post_process(self.d, opkg_post_process_cmds)
diff --git a/meta/lib/oe/package_manager/rpm/rootfs.py b/meta/lib/oe/packag=
e_manager/rpm/rootfs.py
index a120092b83..cdf9c228f5 100644
--- a/meta/lib/oe/package_manager/rpm/rootfs.py
+++ b/meta/lib/oe/package_manager/rpm/rootfs.py
@@ -108,6 +108,7 @@ class PkgRootfs(Rootfs):
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
index 2824d4f037..f24c2697b4 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -104,6 +104,41 @@ class Rootfs(object, metaclass=3DABCMeta):
     def _cleanup(self):
         pass
=20
+    def _setup_pkg_db_rootfs(self, package_paths):
+        gen_pkg_db_fs =3D self.d.getVar('IMAGE_GEN_PKGDBFS') or '0'
+        if gen_pkg_db_fs !=3D '1':
+           return
+
+        bb.note("  Renaming the original rootfs...")
+        try:
+            shutil.rmtree(self.image_rootfs + '-orig')
+        except:
+            pass
+        bb.utils.rename(self.image_rootfs, self.image_rootfs + '-orig')
+
+        bb.note("  Creating pkg-db rootfs...")
+        bb.utils.mkdirhier(self.image_rootfs)
+
+        bb.note("  Copying back package database...")
+        for path in package_paths:
+            bb.utils.mkdirhier(self.image_rootfs + os.path.dirname(path))
+            if os.path.isdir(self.image_rootfs + '-orig' + path):
+                shutil.copytree(self.image_rootfs + '-orig' + path, self.i=
mage_rootfs + path, symlinks=3DTrue)
+            elif os.path.isfile(self.image_rootfs + '-orig' + path):
+                shutil.copyfile(self.image_rootfs + '-orig' + path, self.i=
mage_rootfs + path)
+
+        ####
+
+        bb.note("  Rename pkg-db rootfs...")
+        try:
+            shutil.rmtree(self.image_rootfs + '-pkgdb')
+        except:
+            pass
+        bb.utils.rename(self.image_rootfs, self.image_rootfs + '-pkgdb')
+
+        bb.note("  Restoring original rootfs...")
+        bb.utils.rename(self.image_rootfs + '-orig', self.image_rootfs)
+
     def _setup_dbg_rootfs(self, package_paths):
         gen_debugfs =3D self.d.getVar('IMAGE_GEN_DEBUGFS') or '0'
         if gen_debugfs !=3D '1':
--=20
2.34.1


