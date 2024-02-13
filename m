Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABADEC4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 10:00:23 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.88])
 by mx.groups.io with SMTP id smtpd.web10.8129.1707818421069795543
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 02:00:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=t74ko4JP;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.105.88, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBbmcoiduw/LGbG8n8F/1/4XWGrg15pbQwPi4ucNEjSSB6kjbituCKqtFEx/FpFNVa9oLVnp4GCDvJoZG6ZW3h1viZIO++AICZwe1Y1Y+L0rosmF0htgguy3f98mPkIyKoG9oGTaqskvIfYSPoA19VIcqSwfQZ/VkwzX6GAkQyktlCZArEQjwlnC0/7/zqCIYrmq2QPzKWmhdnz6zISSS0ja15x/514hJatRJ3ClKpxi8EmIgqXqrc/onbsdB9FOlID37NsXqSMGWDg0R3JBHJng0DDkUM+dck6sgLXJ7/3IxyBy9BLvsY9aATu4dBlDa4Ho0AtwkBd5Vj0xXjH+Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLTOfccx61q1iafwvokKp1X+hL4pifMCRFA5tOrQavY=;
 b=fcvKO/n5OLpzfYuX0PoF862eyeGcbQfrrm+m8PFqKkeUqU1DQeBw2u9T62ZwGEEpvLGXkIjCHeEB888gyM/45mLy58ju0qNRhDEOAxlqOY1Lfgso/SBlZMJ4R1QiApiGh436u/T8eQ4i3lGIltKJOyPFx2lzP9z+TV7b+r2n86wo2C/ihuL3ua8xdc2T2escvyHrxfrXUN7rcPKmmsy3+OpgmVlk9uktbHJMZ9t4siwJwre/2Nz8SlEMUsL9TY5sAzRn6/Wbl0CACiucGnnIDBbfToKILp3T91MnV5S0N3620V0w9dbuiit6kLAEt+tIBevZKnYJjz/kJ4nc2svfQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLTOfccx61q1iafwvokKp1X+hL4pifMCRFA5tOrQavY=;
 b=t74ko4JPqpuzxItxSHh1kZjEzdB/2O8EEvF6BtWFYrZ3QAwMQheMkKIMXrIXqF6n1bgM5K8blu1uxgy7L/u9QyF/tp76947yHB6jAg4G7edXp285HcbPRfV8xbPOIcwLuVkWr5NqRPwodC+9yQ3b5eU9ZpYyL8maaI3WXsjbrZo=
Received: from AM6P191CA0084.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::25)
 by VE1PR06MB7005.eurprd06.prod.outlook.com (2603:10a6:800:1a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 10:00:16 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:209:8a:cafe::2c) by AM6P191CA0084.outlook.office365.com
 (2603:10a6:209:8a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Tue, 13 Feb 2024 10:00:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.0 via Frontend Transport; Tue, 13 Feb 2024 10:00:16 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 13 Feb 2024 11:00:15 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v2 2/3] image.bbclass/rootfs: set&unpack package-database
Date: Tue, 13 Feb 2024 11:00:10 +0100
Message-ID: <20240213100012.252237-3-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213100012.252237-1-johannes.schneider@leica-geosystems.com>
References: <20240213100012.252237-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 13 Feb 2024 10:00:15.0222 (UTC) FILETIME=[710BC160:01DA5E63]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F95:EE_|VE1PR06MB7005:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b8844eaf-b969-43f8-428c-08dc2c7a9436
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	plqOoAL7DnNRuvCJFio0WS9Hbk4myV/mz482DcOfhZf8vOsG6GYfg4Np79Mml7ZYX7nKHHCkVjaEFQY1/IwqVSja5psxJCc9vjnDT6B+3LxehJbnFAaJKCrRuiTEVc9PcSFBuPqFP9iNKns28EyXf2k+Y7kmLWbVjmlHCPSVhxhQoPRc5Xn6Myo8EMyR28ves8PINTY6xl61oOFKTWojfYfGf0VNde7P+b2sZDBzdjFdjuXO/OPwMlV3fW/aYv1PpHRDTDOxcC/L8RCPhp5Vf5qTQZygvoMI74iI7eHdB9zsJlAfQ6me40RwAOmTuwaPaaGemNj5h501Yu4WiudIXiiDEHb0G8PiuVl0fs0spFmWB99y630n37AgC+APiE3zd2a5923tttsX+AE9NnejcHIWSdQyqmkt5N8Dong+CkaPeAHYigQaLfBQUjAefaDKxi0NP84+UjrUCAM9Q9FaNdjqmrQ3ad/H3DCtgs3+nP6X2Z0EMiw7BWK2UYHXcbw5M0CcnwotgAvAihfivJnlq5kH45Ly3BVJ2KzRmGb3KLFldUjvMXtJtK2LTd3z7sz0mKlIg0mBl4B+VDgZfdfHqw==
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(39860400002)(346002)(230922051799003)(64100799003)(186009)(451199024)(82310400011)(1800799012)(36840700001)(46966006)(40470700004)(478600001)(6666004)(1076003)(26005)(336012)(107886003)(2616005)(83380400001)(5660300002)(2906002)(6916009)(8676002)(70586007)(70206006)(8936002)(41300700001)(44832011)(316002)(4326008)(36756003)(82740400003)(356005)(81166007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 10:00:16.3515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8844eaf-b969-43f8-428c-08dc2c7a9436
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB7005
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 10:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195384

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
 meta/classes-recipe/image.bbclass         | 10 +++++++-
 meta/lib/oe/package_manager/deb/rootfs.py |  2 ++
 meta/lib/oe/package_manager/ipk/rootfs.py |  6 +++--
 meta/lib/oe/package_manager/rpm/rootfs.py |  7 ++++--
 meta/lib/oe/rootfs.py                     | 29 +++++++++++++++++++++++
 5 files changed, 49 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.=
bbclass
index c688c39f15..b4a2460187 100644
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
@@ -134,7 +142,7 @@ def rootfs_variables(d):
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
+                 'CONVERSIONTYPES', 'IMAGE_GEN_PKGDBFS', 'IMAGE_BASE_PKGDB=
', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCL=
UDE_COMPLEMENTARY', 'REPRODUCIBLE_TIMESTAMP_ROOTFS',
                  'IMAGE_INSTALL_DEBUGFS']
     variables.extend(rootfs_command_variables(d))
     variables.extend(variable_depends(d))
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


