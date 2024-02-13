Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F462C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 08:58:23 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.46])
 by mx.groups.io with SMTP id smtpd.web11.7659.1707814693077923189
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 00:58:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=tRuChDyM;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.20.46, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOUe9rw/MhrHVENKnVRxqDhWEIu50iOp0mhfKURDzbhEK1uBbLKY3n654YNnuespDMtAwmVkbaMun6xAjgSfw8U8zQF+BLgn3ZQcpmTViMYb9ReVJdjTXeQZXH079N/4sf4hN6su8IViyPPqUOxPX/YZMBk9+yWmhhRkzbRZ1mUQZeUtvzz101ZEHVBjreO61N5Z2wwrGzEa9RAmi06FRfNzENOgiWVF12FzdeiZi/uLAgdIQtUPhNP+lLc0ibqYQ5mY3BaM3xRRpgc1OcG3+ku+/TeQpq/Qj6+FtGZ01oEQvyvrSGuz7R5nQuz6m872mz7lewviYY1G/s3TmEvxCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SFV/jrQlq566v3g/yrBb7ofJKt3tEuVTpephmxnmJY=;
 b=FR1aJJEaeEPbCh+tqKqbycVCEHIVUdIN+ptIsvjmuLwZd82VQvfmI75FjOuIlfaTWmRwlXqlOYF26Lr4LnAmzTBEeJNDx0twr1a96Mo5XGHD0D2gHcHF5wKg46ZW3d2bCFdg/8or7pidXCfl1rJiMqYT/0YQagRdDt6gxAUnNSpS7aVXhs9r31U8FXP+Fws6wZROWRhNT8i3mnqZHanXztyYDuMUu7Tz9RCrqVRuZI2b96XgV+soFvvtajsbIsaDGXMN7G8ehXJ+tAlUKCnkLsgnPVA3Phc8gNZFzM7y/rzsBpbXTXzaUFd9eDt4OVCa/h3z/51bW8Wgrx4h1g510A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SFV/jrQlq566v3g/yrBb7ofJKt3tEuVTpephmxnmJY=;
 b=tRuChDyMvZ1X5CV7/t8vmVa3XfHA6aaERam+dhruiStUTvGNri7ELEsLt8bi/Wq7RbngzabRQcnEmwJl77tzD5lVMZMR9Ax2HB8f++cN1+6vceO0MGAHBNUW4La4OfE1R8oQsfNlUB2gEpt1jm8yRXG1YdcwyLbKr0CFZhQa6oI=
Received: from AS4P189CA0003.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::8)
 by AS8PR06MB7334.eurprd06.prod.outlook.com (2603:10a6:20b:25a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38; Tue, 13 Feb
 2024 08:58:08 +0000
Received: from AM4PEPF00027A67.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::7) by AS4P189CA0003.outlook.office365.com
 (2603:10a6:20b:5d7::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38 via Frontend
 Transport; Tue, 13 Feb 2024 08:58:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM4PEPF00027A67.mail.protection.outlook.com (10.167.16.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 08:58:08 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 13 Feb 2024 09:58:08 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v1 2/3] image.bbclass/rootfs: set&unpack package-database
Date: Tue, 13 Feb 2024 09:56:56 +0100
Message-ID: <20240213085658.170917-3-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213085658.170917-1-johannes.schneider@leica-geosystems.com>
References: <20240213085658.170917-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 13 Feb 2024 08:58:08.0296 (UTC) FILETIME=[C39FFA80:01DA5E5A]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A67:EE_|AS8PR06MB7334:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2e53d2f4-1a95-4e63-a0be-08dc2c71e63d
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ryt7l5PE3JiYvOiV9lgSM61sNiNy2/Y0tKaEm6vMdiO9LPCgDBu1iYTDw6R2UbmU2yiudZ3fbUQ5fPJYLCBvbAYNDM8m8DNcr5XPdUDmaDpwgj9vIVkvtOU9X543fQ/CY8Q7nIbLPLz5iIpz5xpZ5XB0pXN/gUhzOcBJwPbc+TdA/lEh+iNtQpqjDj7FzgnCNzdLgIAOWUBaInrZpOktvcsRkZ2s+BpE/JYBmFip2+G+5l3XJvbUnkEHVuelHbAnRA9MwTHTQrWv6PHtikfL44hrD2cyEAFUhDjVU+MR/ElU2cXMJJTU9tAhG76JPOlZZv4t3RvRZT13MnKLC9w9P7sIVgUaEX/Nox2HYJr818t0luD71Lrhyxm0NYFj8rqnqrYPitUUjtMuzcglCvelXHcoDfbKech8XIsPx6ClfeLbFSxyXGJtNgDRxBFqOZgOSHTXDNZ7zk5PXykixmk4qx4tUa+9CfKl2jCPW0ElIEd4oROlJjElNoWbpnwg1rnN4p4rkMi2Ilkl+bqGVaKvxu6xLcOObMbeFQ0EzpnOlw9QaXU27ks0EWnbPucRE55XVnbaX2Ln8L1T0Cgox+wLRw==
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(82310400011)(1800799012)(186009)(46966006)(36840700001)(40470700004)(41300700001)(478600001)(6666004)(2906002)(44832011)(4326008)(70586007)(70206006)(5660300002)(336012)(26005)(1076003)(107886003)(2616005)(36756003)(6916009)(8936002)(86362001)(316002)(8676002)(81166007)(356005)(82740400003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 08:58:08.5180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e53d2f4-1a95-4e63-a0be-08dc2c71e63d
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7334
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 08:58:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195376

set the package-database of a "lower image" to unpack and build upon when
installing packages for the current image. This way a lean image will be
created, which only holds the packages that are not already present in the =
lower
image, that then could be used with overlayfs or systemd-sysext to extend t=
he
"lower image" on demand; for development purposes on an RO lower image for
example.

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta/classes/image.bbclass                | 10 +++++++-
 meta/lib/oe/package_manager/deb/rootfs.py |  2 ++
 meta/lib/oe/package_manager/ipk/rootfs.py |  6 +++--
 meta/lib/oe/package_manager/rpm/rootfs.py |  7 ++++--
 meta/lib/oe/rootfs.py                     | 29 +++++++++++++++++++++++
 5 files changed, 49 insertions(+), 5 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index c8919a4857..9cf65438a1 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -36,8 +36,16 @@ IMAGE_FEATURES ?=3D ""
 IMAGE_FEATURES[type] =3D "list"
 IMAGE_FEATURES[validitems] +=3D "debug-tweaks read-only-rootfs read-only-r=
ootfs-delayed-postinsts stateless-rootfs empty-root-password allow-empty-pa=
ssword allow-root-login post-install-logging overlayfs-etc"
=20
+# Image layering:
+# a "base image" would create a snapshot of the package-database after the
+# installation of all packages into the rootfs is done. The next/other ima=
ge
+# "layered on-top" of the former would then import that database and insta=
ll
+# further packages; without reinstalling package dependencies that are alr=
eady
+# installed in the layer below.
 # Generate snapshot of the package database?
 IMAGE_GEN_PKGDBFS ?=3D "0"
+# Package-database of the base image, upon which to build up a new image-l=
ayer
+IMAGE_BASE_PKGDB ?=3D ""
=20
 # Generate companion debugfs?
 IMAGE_GEN_DEBUGFS ?=3D "0"
@@ -128,7 +136,7 @@ def rootfs_variables(d):
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
-                 'CONVERSIONTYPES', 'IMAGE_GEN_PKGDBFS', 'IMAGE_GEN_DEBUGF=
S', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY', =
'REPRODUCIBLE_TIMESTAMP_ROOTFS', 'IMAGE_INSTALL_DEBUGFS']
+                 'CONVERSIONTYPES', 'IMAGE_GEN_PKGDBFS', 'IMAGE_BASE_PKGDB=
', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCL=
UDE_COMPLEMENTARY', 'REPRODUCIBLE_TIMESTAMP_ROOTFS', 'IMAGE_INSTALL_DEBUGFS=
']
     variables.extend(rootfs_command_variables(d))
     variables.extend(variable_depends(d))
     return " ".join(variables)
diff --git a/meta/lib/oe/package_manager/deb/rootfs.py b/meta/lib/oe/packag=
e_manager/deb/rootfs.py
index 08d8aa9813..6538fee18a 100644
--- a/meta/lib/oe/package_manager/deb/rootfs.py
+++ b/meta/lib/oe/package_manager/deb/rootfs.py
@@ -150,6 +150,8 @@ class PkgRootfs(DpkgOpkgRootfs):
=20
         execute_pre_post_process(self.d, deb_pre_process_cmds)
=20
+        self._unpack_pkg_db_rootfs(['/var/lib/dpkg'])
+
         if self.progress_reporter:
             self.progress_reporter.next_stage()
             # Don't support incremental, so skip that
diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/packag=
e_manager/ipk/rootfs.py
index 14bf6cac98..9c1ba81bcb 100644
--- a/meta/lib/oe/package_manager/ipk/rootfs.py
+++ b/meta/lib/oe/package_manager/ipk/rootfs.py
@@ -274,12 +274,16 @@ class PkgRootfs(DpkgOpkgRootfs):
         pkgs_to_install =3D self.manifest.parse_initial_manifest()
         opkg_pre_process_cmds =3D self.d.getVar('OPKG_PREPROCESS_COMMANDS'=
)
         opkg_post_process_cmds =3D self.d.getVar('OPKG_POSTPROCESS_COMMAND=
S')
+        opkg_lib_dir =3D self.d.getVar('OPKGLIBDIR')
+        opkg_dir =3D os.path.join(opkg_lib_dir, 'opkg')
=20
         # update PM index files
         self.pm.write_index()
=20
         execute_pre_post_process(self.d, opkg_pre_process_cmds)
=20
+        self._unpack_pkg_db_rootfs([opkg_dir])
+
         if self.progress_reporter:
             self.progress_reporter.next_stage()
             # Steps are a bit different in order, skip next
@@ -315,8 +319,6 @@ class PkgRootfs(DpkgOpkgRootfs):
         if self.progress_reporter:
             self.progress_reporter.next_stage()
=20
-        opkg_lib_dir =3D self.d.getVar('OPKGLIBDIR')
-        opkg_dir =3D os.path.join(opkg_lib_dir, 'opkg')
         self._setup_pkg_db_rootfs([opkg_dir])
         self._setup_dbg_rootfs([opkg_dir])
=20
diff --git a/meta/lib/oe/package_manager/rpm/rootfs.py b/meta/lib/oe/packag=
e_manager/rpm/rootfs.py
index cdf9c228f5..0face72320 100644
--- a/meta/lib/oe/package_manager/rpm/rootfs.py
+++ b/meta/lib/oe/package_manager/rpm/rootfs.py
@@ -65,12 +65,15 @@ class PkgRootfs(Rootfs):
         pkgs_to_install =3D self.manifest.parse_initial_manifest()
         rpm_pre_process_cmds =3D self.d.getVar('RPM_PREPROCESS_COMMANDS')
         rpm_post_process_cmds =3D self.d.getVar('RPM_POSTPROCESS_COMMANDS'=
)
+        package_paths =3D ['/etc/rpm', '/etc/rpmrc', '/etc/dnf', '/var/lib=
/rpm', '/var/cache/dnf', '/var/lib/dnf']
=20
         # update PM index files
         self.pm.write_index()
=20
         execute_pre_post_process(self.d, rpm_pre_process_cmds)
=20
+        self._unpack_pkg_db_rootfs(package_paths)
+
         if self.progress_reporter:
             self.progress_reporter.next_stage()
=20
@@ -108,8 +111,8 @@ class PkgRootfs(Rootfs):
         if self.progress_reporter:
             self.progress_reporter.next_stage()
=20
-        self._setup_pkg_db_rootfs(['/etc/rpm', '/etc/rpmrc', '/etc/dnf', '=
/var/lib/rpm', '/var/cache/dnf', '/var/lib/dnf'])
-        self._setup_dbg_rootfs(['/etc/rpm', '/etc/rpmrc', '/etc/dnf', '/va=
r/lib/rpm', '/var/cache/dnf', '/var/lib/dnf'])
+        self._setup_pkg_db_rootfs(package_paths)
+        self._setup_dbg_rootfs(package_paths)
=20
         execute_pre_post_process(self.d, rpm_post_process_cmds)
=20
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index f24c2697b4..613357df60 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -104,6 +104,35 @@ class Rootfs(object, metaclass=3DABCMeta):
     def _cleanup(self):
         pass
=20
+    def _unpack_pkg_db_rootfs(self, package_paths):
+        import tarfile
+        gen_pkg_db_fs =3D self.d.getVar('IMAGE_BASE_PKGDB') or ''
+        if gen_pkg_db_fs =3D=3D '':
+           return
+
+        fname =3D self.d.getVar('DEPLOY_DIR_IMAGE') + '/' + self.d.getVar(=
'IMAGE_BASE_PKGDB') + '-pkgdb.tar.gz'
+        if not fname:
+            bb.warn("PKGDB does not exit:", fname)
+            return
+
+        bb.note("  unpacking package database...")
+        bb.utils.mkdirhier(self.image_rootfs + '-pkgdb')
+        if fname.endswith("tar.gz"):
+            tar =3D tarfile.open(fname, "r:gz")
+            tar.extractall(path=3Dself.image_rootfs + '-pkgdb')
+            tar.close()
+
+        bb.note("  Copying back package database...")
+        for path in package_paths:
+            try:
+                bb.utils.mkdirhier(self.image_rootfs + os.path.dirname(pat=
h))
+            except:
+                pass
+            if os.path.isdir(self.image_rootfs + '-pkgdb' + path):
+                shutil.copytree(self.image_rootfs + '-pkgdb' + path, self.=
image_rootfs + path, symlinks=3DTrue, dirs_exist_ok=3DTrue)
+            elif os.path.isfile(self.image_rootfs + '-pkgdb' + path):
+                shutil.copyfile(self.image_rootfs + '-pkgdb' + path, self.=
image_rootfs + path)
+
     def _setup_pkg_db_rootfs(self, package_paths):
         gen_pkg_db_fs =3D self.d.getVar('IMAGE_GEN_PKGDBFS') or '0'
         if gen_pkg_db_fs !=3D '1':
--=20
2.34.1


