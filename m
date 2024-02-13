Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253D9C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 10:38:04 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.75])
 by mx.groups.io with SMTP id smtpd.web11.8835.1707820680725296701
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 02:38:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=SR1llE+I;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.105.75, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yk3U2KCaupL8nol4UJ8spgdqRGPK78xJQVEB5b6hEdRoa0wRI/7JUCtjZoMyczZYtpYQNsvzMjpNN1SmtoJ3DRxfIRNH9ALr1SXq5U8Mbg5kxQUL1gEPuZXw9ppfuyW4sgAJU4c036rDx76xMYjdsSnz9dx6wgQSiZWmxk5ey5PXUnEus740gMfTn9VpoeXESboyZEmDtDqNKjX3KvreQLZhd6E3YZYRddRyF2op7ovDo/KgamkZrbEWbXOEuUOIOF0KBm3APwLIbwsMUBYxPlNX1ZbCfHE5suITLkjqdHIvScQIfl1I63YaPa+texM9rpUmKtim2TpQMVAIb6+CeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzZ0SzUYpdQkG28IQUj89FCQ9scvANYDheUzAZ54VJ4=;
 b=NyUe0RL8g6VrciE+WttePV/om17GDiIMq0WKQ/IZSBO+MOkB52WfnyK6wH0YRIFIGLQqbUzdEb6dxp9Ym9J/q48M9CXMLmUpEqQF492MCJ8Tll7nn2jEF27gM5ASw1mcuyqvTtpSxdeLRPfYJznwt86wG8iok3rSYjudKEMlPe0TosJuqZmfpuIp/pWwE78lJ+dnZ8z4/2VCiuQxby8OVQBnLK2sJ2jVzDUUk5wBhXVXsu0XtYeJYlXe65xxMotWXOQVaDazIODvVWWymtq8b7m/QcIG8itIMBrTZBElpgci9tK6skDPLsgFkGgo1wCH4WG72ne3ybxzJxYe6QP5rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzZ0SzUYpdQkG28IQUj89FCQ9scvANYDheUzAZ54VJ4=;
 b=SR1llE+IxLDCelXN48JlxANiLMyACnO+01OhhYa4hn10vajoKiB6Yb5RkLF6y1ohpsR0XofN2NaXU005f3iIPZdTZvbtq8V3OO2x+SEMiPM+RR0sjph4mQ69QBXFUKowRKotpPsUOV2QD8byOmVFl/0dxTCLjRw7rw3guaQb4D8=
Received: from AS9PR04CA0178.eurprd04.prod.outlook.com (2603:10a6:20b:530::23)
 by AM8PR06MB6833.eurprd06.prod.outlook.com (2603:10a6:20b:1d6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.37; Tue, 13 Feb
 2024 10:37:57 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:20b:530:cafe::e2) by AS9PR04CA0178.outlook.office365.com
 (2603:10a6:20b:530::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.40 via Frontend
 Transport; Tue, 13 Feb 2024 10:37:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 10:37:56 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 13 Feb 2024 11:37:56 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v2 2/3] image.bbclass/rootfs: set and unpack package-database
Date: Tue, 13 Feb 2024 11:37:53 +0100
Message-ID: <20240213103754.1622358-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 13 Feb 2024 10:37:56.0446 (UTC) FILETIME=[B4D727E0:01DA5E68]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA0:EE_|AM8PR06MB6833:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 29de1bb1-3ec5-4dda-c458-08dc2c7fd774
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4lWle1AUNWzA1rSbIFujGcwZDSYEYdxE1ZmftQnoYCz14ekiTsUUONRXBFge+N8MWOA+NzUwcHjKDf4z+MqtFqME9VrciAsYvmRGeQqG+ZuMZQqIRwKCB1HL5KJtB9Xnteze6gZph5BbDiQtuHYtUqitNm5EPqLN9lXR9LWp5jsK2PU45Y/yswZkqTZ1ZTf+H4VvQyVpipdgz8H1gWXX1Gwiz3x/n4spSr4AvCm0bg7CbSr6DKKxFKVV6SVtWlHHPYSUIZ9J9xjABjEVdnxfT0T5LGSCdardtDq9C/0MrUhmi0YlccWjvy8jqBkdFfyWAulFJWSHV7AwtnQBsGJbi9KO12swHNr1GkpqowWqxKwBo6Gf2lilqTGuFspHybFzGeqJQ42MTbVLm9rq5IREQgAULxIvwKxwnDCgUKW4X17LrcH6XrAOSqye3SZQpWKs3qdIxQcQZXTJh+ZlCeVrZC3Rtb2pv9FZe4TYPmyKX3s8240QSJedHaZdgNdOno7U3d75JHqBpoeav+Z4eXvQvqYGcNgXweqhF1UnbY6U7gOvzLJdDx42B3iQnWzBeOSYUYD2OoQs3lNSu9trluBvIA==
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(346002)(136003)(376002)(230922051799003)(64100799003)(451199024)(186009)(82310400011)(1800799012)(46966006)(40470700004)(36840700001)(36756003)(41300700001)(6666004)(478600001)(83380400001)(44832011)(5660300002)(70586007)(70206006)(2906002)(2616005)(336012)(107886003)(1076003)(26005)(82740400003)(4326008)(6916009)(86362001)(356005)(316002)(8936002)(81166007)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 10:37:56.6677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29de1bb1-3ec5-4dda-c458-08dc2c7fd774
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB6833
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 10:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195387

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
 meta/classes-recipe/image.bbclass         | 12 ++++++++--
 meta/lib/oe/package_manager/deb/rootfs.py |  2 ++
 meta/lib/oe/package_manager/ipk/rootfs.py |  6 +++--
 meta/lib/oe/package_manager/rpm/rootfs.py |  7 ++++--
 meta/lib/oe/rootfs.py                     | 29 +++++++++++++++++++++++
 5 files changed, 50 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.=
bbclass
index c688c39f15..e6c79ad05d 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -42,8 +42,16 @@ IMAGE_FEATURES ?=3D ""
 IMAGE_FEATURES[type] =3D "list"
 IMAGE_FEATURES[validitems] +=3D "debug-tweaks read-only-rootfs read-only-r=
ootfs-delayed-postinsts stateless-rootfs empty-root-password allow-empty-pa=
ssword allow-root-login serial-autologin-root post-install-logging overlayf=
s-etc"
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
@@ -134,8 +142,8 @@ def rootfs_variables(d):
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
'REPRODUCIBLE_TIMESTAMP_ROOTFS',
-                 'IMAGE_INSTALL_DEBUGFS']
+                 'CONVERSIONTYPES', 'IMAGE_GEN_PKGDBFS', 'IMAGE_BASE_PKGDB=
', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCL=
UDE_COMPLEMENTARY',
+                 'REPRODUCIBLE_TIMESTAMP_ROOTFS', 'IMAGE_INSTALL_DEBUGFS']
     variables.extend(rootfs_command_variables(d))
     variables.extend(variable_depends(d))
     return " ".join(variables)
diff --git a/meta/lib/oe/package_manager/deb/rootfs.py b/meta/lib/oe/packag=
e_manager/deb/rootfs.py
index 43107c8663..71a21df09b 100644
--- a/meta/lib/oe/package_manager/deb/rootfs.py
+++ b/meta/lib/oe/package_manager/deb/rootfs.py
@@ -152,6 +152,8 @@ class PkgRootfs(DpkgOpkgRootfs):
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
index 64d9bc7969..408faa8030 100644
--- a/meta/lib/oe/package_manager/ipk/rootfs.py
+++ b/meta/lib/oe/package_manager/ipk/rootfs.py
@@ -276,12 +276,16 @@ class PkgRootfs(DpkgOpkgRootfs):
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
@@ -317,8 +321,6 @@ class PkgRootfs(DpkgOpkgRootfs):
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
index 673006c131..9986b13b5f 100644
--- a/meta/lib/oe/package_manager/rpm/rootfs.py
+++ b/meta/lib/oe/package_manager/rpm/rootfs.py
@@ -67,12 +67,15 @@ class PkgRootfs(Rootfs):
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
@@ -110,8 +113,8 @@ class PkgRootfs(Rootfs):
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
index 9268a02531..7ca574e6b1 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -106,6 +106,35 @@ class Rootfs(object, metaclass=3DABCMeta):
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


