Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BA8C54E55
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 06:16:07 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.59])
 by mx.groups.io with SMTP id smtpd.web10.92488.1709532962750688567
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Mar 2024 22:16:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=VH3UGKYe;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.20.59, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqRqyALJN1uQ1B8LBmSMTMSDbQIxBJrNh5uCAo6y69cfj7fMcoTznh07OId3PE6uDmcbEacMw5rr4z6QanzMUEWuhdzqDjmZ3R9msD+VKftryf+Zjm1tpvWBIfvFGXgDZfh/K7eP9YcVqpJf1sMiMn8ij0OK80xxzEkP+EGc8kj+h8RRnr99iF9OQlxjp/lqpDaviTcWoP3QUWvZG+EWW5fFMOSalQBPMyfevWHEZxilY+C3dOrQ911lNlw3jJDuSm2Mv78rNQ7GxAi1S5iGsfC3jcD0opsMu7SP9wbsPVHeU21UUR55Ug3JZNuT8AKRo3vwAoPQtThoA7pgLH+Orw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfMB7I697gzwTDanUr517pxqtfp2NPpni+f66Z7aGIE=;
 b=OvRvLFp5Mx1MlJguWWI5osXesNCpTGSmiGmKYTAvlkuKv59zWhL6yIvF3xLlzoG0S6iLmuUX3ARtv8Hn3gMBBU9Z2T5tnBSrQzcGesgM/z/KlfBNXIS7yQ4QgGTf5/VZMpscK1Cxr9KojYlIUqzuYHpCYu2rtnQf2EWbzA1FHrVZM9B9BA29RQJfY58BlOmVoTCQf9ajCTqD2HG9x4LQGqRHjTrafZcQ/nyx0kUIh0/+XA3Mac81xYcneH1XDW2ybXUqj+by47pj4aPx70YLTkrLqqf73/hBqAyqZNsLrI2M+im8KhCOZ2CNDcjaQQWpgnn2qR/l5kg5ibnubQJ8vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfMB7I697gzwTDanUr517pxqtfp2NPpni+f66Z7aGIE=;
 b=VH3UGKYemoes84tYeLcXWxSk5J9PMDoX4lzW4s34DdoIHOx3tUTrA0+CYfYmyb6nT3WrviKMlaKXj9JRjircUHtQNz96NRblNk9cs1zUCURXblEV/2ZaF3FelquievLQdDSVZ5vhullEMdoo2DgnGwTOWul6Vrb4ZdzvjpVYLcY=
Received: from DU6P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::21)
 by DUZPR06MB8748.eurprd06.prod.outlook.com (2603:10a6:10:4da::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Mon, 4 Mar
 2024 06:15:59 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:540:cafe::e1) by DU6P191CA0004.outlook.office365.com
 (2603:10a6:10:540::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Mon, 4 Mar 2024 06:15:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.11 via Frontend Transport; Mon, 4 Mar 2024 06:15:58 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 4 Mar 2024 07:15:57 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v4 2/3] image.bbclass/rootfs: set and unpack package-database
Date: Mon,  4 Mar 2024 07:15:52 +0100
Message-ID: <20240304061553.2281009-3-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240304061553.2281009-1-johannes.schneider@leica-geosystems.com>
References: <20240304061553.2281009-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 04 Mar 2024 06:15:57.0646 (UTC) FILETIME=[6BF79EE0:01DA6DFB]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D09:EE_|DUZPR06MB8748:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4d83cd30-5df5-4766-7be1-08dc3c128f3a
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Clh8pHYA5aJVkGen+4Y0UM3sFXB6LDMc1Na6SUzzTEAED7rInmSQ85buuDypsG1WN4Qy9YV46GrNM9mSehb2sNjyk5+XuljbQlHwBBB3T6Oy5HRxm1uchkQFV1LeF3lWif4PxXBn/HjpcS7aeBooH66Kg494+TbcO49aV22BKMoDQd2bohsLgVuaG/qrO3QGAqcYDKo20aOhwGFyT/iHCQ8VZL1eKodGtL2Dyp0BaK+5oXM+ei+wwCY3TAM/LmgEWnOknLqz48NnOWMOfI5r6IyCXWZ0+5YWUwwSA6jsKaBGIDBLXfIL92mAPHFBxawob8FUM4XmTjF66W/9Pr5n4FoYv3ggzB80hN4vp3lmxeovBH97T1OK/P/WUCdyc5m/94f1Y8U4S3hrOd54DICBR8/Oh68apDlgJtWAaypMdvMQulixc+NfZeSktx2HwFrJtOtj1X0/V34UEsklINqXseGvnHG/oauxaWLGgdt0L9O2lxp5AqaFqPlL/AQqErbevnj562z7iP/U11KrUaCIGEdqRsVqBWEnJlA1JZEbs6o0BYPjDupwNc196qX/NLVTzXsK4c0494SKeooJG3iBZpDjM9ovfzA8kp7fmj2oW4NEDlY4k2kEdbt7TJklh0JYw47yTYfYeBxe52OUSKMyAPltHXEknU1rf5V/PZP7NxY9hoPdv6fphsbdE2KiEXtuK8rFHu2gW5t8rDUF+9mIqA==
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 06:15:58.9195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d83cd30-5df5-4766-7be1-08dc3c128f3a
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR06MB8748
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 06:16:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196587

set the package-database of a "lower image" to unpack and build upon
when installing packages for the current image. This way a lean image
will be created, which only holds the packages that are not already
present in the lower image.

An image build such could then be used with overlayfs or systemd-
sysext to extend the "lower image" on demand; for development purposes
on a device running the "lower image" in RO mode for example.

A configuration could look as follows:
  some-core-image.bb
    inherit image
    IMAGE_GEN_PKGDBFS =3D "1"

  extending-image.bb
    inherit image
    IMAGE_BASE_PKGDB =3D "some-core-image"

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta/classes-recipe/image.bbclass             | 23 ++++++++--
 meta/conf/documentation.conf                  |  3 +-
 meta/lib/oe/package_manager/deb/rootfs.py     |  2 +
 meta/lib/oe/package_manager/ipk/rootfs.py     |  6 ++-
 meta/lib/oe/package_manager/rpm/rootfs.py     |  7 ++-
 meta/lib/oe/rootfs.py                         | 18 ++++++++
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 46 +++++++++++++++++++
 7 files changed, 97 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.=
bbclass
index 3ccaaa17b8..c573c37cd8 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -42,8 +42,16 @@ IMAGE_FEATURES ?=3D ""
 IMAGE_FEATURES[type] =3D "list"
 IMAGE_FEATURES[validitems] +=3D "debug-tweaks read-only-rootfs read-only-r=
ootfs-delayed-postinsts stateless-rootfs empty-root-password allow-empty-pa=
ssword allow-root-login serial-autologin-root post-install-logging overlayf=
s-etc"
=20
-# Generate snapshot of the package database?
+# Image layering:
+# a "base image" would create a snapshot of the package-database after the
+# installation of all packages into the rootfs is done. The next/other ima=
ge
+# "layered on-top" of the former would then import that database and insta=
ll
+# further packages; without reinstalling packages/dependencies that are al=
ready
+# installed in the layer below.
+# Set to '1' in a "base image" recipe, to preserve a snapshot of the packa=
ge database.
 IMAGE_GEN_PKGDBFS ?=3D "0"
+# "PN" of a "base image", upon which the current image is to be built upon=
.
+IMAGE_BASE_PKGDB ?=3D ""
=20
 # Generate companion debugfs?
 IMAGE_GEN_DEBUGFS ?=3D "0"
@@ -118,6 +126,15 @@ do_rootfs[depends] +=3D " \
 "
 do_rootfs[recrdeptask] +=3D "do_packagedata"
=20
+python () {
+    # make sure that the 'base image' has been queued in before this
+    # image wants to unpack and build upon the formers pgkdb
+    base_image =3D d.getVar('IMAGE_BASE_PKGDB')
+    pn =3D d.getVar('PN')
+    if base_image and base_image !=3D pn:
+        d.appendVarFlag("do_rootfs", 'depends', ' '+ base_image + ':do_ima=
ge_complete')
+}
+
 def rootfs_command_variables(d):
     return ['ROOTFS_POSTPROCESS_COMMAND','ROOTFS_PREPROCESS_COMMAND','ROOT=
FS_POSTINSTALL_COMMAND','ROOTFS_POSTUNINSTALL_COMMAND','OPKG_PREPROCESS_COM=
MANDS','OPKG_POSTPROCESS_COMMANDS','IMAGE_POSTPROCESS_COMMAND',
             'IMAGE_PREPROCESS_COMMAND','RPM_PREPROCESS_COMMANDS','RPM_POST=
PROCESS_COMMANDS','DEB_PREPROCESS_COMMANDS','DEB_POSTPROCESS_COMMANDS']
@@ -134,8 +151,8 @@ def rootfs_variables(d):
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
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 36aebb59ab..9f493cfe96 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -208,6 +208,7 @@ ICECC_PATH[doc] =3D "The location of the icecc binary."
 ICECC_CLASS_DISABLE[doc] =3D "Identifies user classes that you do not want=
 the Icecream distributed compile support to consider."
 ICECC_RECIPE_DISABLE[doc] =3D "Identifies user recipes that you do not wan=
t the Icecream distributed compile support to consider."
 ICECC_RECIPE_ENABLE[doc] =3D "Identifies user recipes that use an empty PA=
RALLEL_MAKE variable that you want to force remote distributed compilation =
on using the Icecream distributed compile support."
+IMAGE_BASE_PKGDB[doc] =3D "Set to the PN of a base-image name, which was b=
uilt with IMAGE_GEN_PKGDBFS enabled; Then this image will only add/install =
packages into its rootfs that are not already in the base-image."
 IMAGE_BASENAME[doc] =3D "The base name of image output files."
 IMAGE_BOOT_FILES[doc] =3D "Whitespace separated list of files from ${DEPLO=
Y_DIR_IMAGE} to place in boot partition. Entries will be installed under a =
same name as the source file. To change the destination file name, pass a d=
esired name after a semicolon (eg. u-boot.img;uboot)."
 IMAGE_CLASSES[doc] =3D "A list of classes that all images should inherit."
@@ -215,7 +216,7 @@ IMAGE_FEATURES[doc] =3D "The primary list of features t=
o include in an image. Conf
 IMAGE_FSTYPES[doc] =3D "Formats of root filesystem images that you want to=
 have created."
 IMAGE_FSTYPES_DEBUGFS[doc] =3D "Formats of the debug root filesystem image=
s that you want to have created."
 IMAGE_GEN_DEBUGFS[doc] =3D "When set to '1', generate a companion debug ob=
ject/source filesystem image."
-IMAGE_GEN_PKGDBFS[doc] =3D "When set to '1', create a snapshot of the pack=
age-manager state after the rootfs has been assembled."
+IMAGE_GEN_PKGDBFS[doc] =3D "When set to '1', create a snapshot of the pack=
age-manager state after the rootfs has been assembled; This snapshot can th=
en be used in a different image recipe, that sets IMAGE_BASE_PKGDB to this =
images PN."
 IMAGE_INSTALL[doc] =3D "Specifies the packages to install into an image. I=
mage recipes set IMAGE_INSTALL to specify the packages to install into an i=
mage through image.bbclass."
 IMAGE_LINGUAS[doc] =3D "Specifies the list of locales to install into the =
image during the root filesystem construction process."
 IMAGE_NAME[doc] =3D "The name of the output image files minus the extensio=
n."
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
index 6d6e888a30..9d691c58cd 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -106,6 +106,24 @@ class Rootfs(object, metaclass=3DABCMeta):
     def _cleanup(self):
         pass
=20
+    def _unpack_pkg_db_rootfs(self, package_paths):
+        import tarfile
+        pn =3D self.d.getVar('PN')
+        base_pkgdb =3D self.d.getVar('IMAGE_BASE_PKGDB')
+        if not base_pkgdb or pn =3D=3D base_pkgdb:
+            return
+
+        fname =3D self.d.getVar('DEPLOY_DIR_IMAGE') + '/' + self.d.getVar(=
'IMAGE_BASE_PKGDB') + '-' + self.d.getVar('MACHINE')  + '.rootfs-pkgdb.tar.=
gz'
+        if not os.path.exists(fname):
+            bb.fatal("PKGDB for '%s' does not exist,\n\texpected: %s\n\tth=
e recipe for '%s' should set: IMAGE_GEN_PKGDBFS=3D'1'" % (base_pkgdb, fname=
, base_pkgdb))
+            return
+
+        bb.note("  unpacking base image package database...")
+        if fname.endswith("tar.gz"):
+            tar =3D tarfile.open(fname, "r:gz")
+            tar.extractall(path=3Dself.image_rootfs)
+            tar.close()
+
     def _setup_pkg_db_rootfs(self, package_paths):
         gen_pkg_db_fs =3D bb.utils.to_boolean(self.d.getVar('IMAGE_GEN_PKG=
DBFS'))
         if not gen_pkg_db_fs:
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/=
selftest/cases/imagefeatures.py
index 9adde6c6f1..bd2ee894f7 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -353,6 +353,52 @@ SKIP_RECIPE[busybox] =3D "Don't build this"
         # check for a common base package, a random library for example:
         self.assertTrue("libc6" in result.output, msg=3D'Failed query inst=
alled packages')
=20
+    def test_image_use_pkgdbfs(self):
+        """
+        Summary:     Check pkgdb snapshot
+        Expected:    1. core-image-minimal is built with IMAGE_GEN_PKGDBFS=
 variable set
+                     2. core-image-minimal-mtdutils is built with:
+                        IMAGE_BASE_PKGDB pointing to the former, to build =
upon it
+                     3. the rootfs of both images is checked, and there sh=
ould be no file
+                        from any of the installed packages that shows up i=
n both images
+        """
+
+        base_image =3D 'core-image-minimal'
+        extension_image =3D 'core-image-minimal-mtdutils'
+
+        features =3D 'IMAGE_FSTYPES =3D "tar.bz2"\n'
+        # enable usrmerge so that all relevant pieces are in one place =3D=
 /usr
+        features +=3D 'DISTRO_FEATURES +=3D "usrmerge"\n'
+        features +=3D 'IMAGE_GEN_PKGDBFS =3D "1"\n'
+        features +=3D 'IMAGE_BASE_PKGDB =3D "%s"\n' % base_image
+        self.write_config(features)
+
+        # through task dependencies the base_image should automagically be=
 built
+        bitbake(extension_image)
+
+        # collect image content of both images
+        img_vars =3D get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], =
base_image)
+        img_file =3D os.path.join(img_vars['DEPLOY_DIR_IMAGE'], "%s.%s" % =
(img_vars['IMAGE_LINK_NAME'], 'tar.bz2'))
+        self.logger.debug("base image: %s" % img_file)
+        img_content =3D runCmd('tar -tf %s' % img_file)
+
+        ext_vars =3D get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], =
extension_image)
+        ext_file =3D os.path.join(ext_vars['DEPLOY_DIR_IMAGE'], "%s.%s" % =
(ext_vars['IMAGE_LINK_NAME'], 'tar.bz2'))
+        self.logger.debug("extension image: %s" % ext_file)
+        ext_content =3D runCmd('tar -tf %s' % ext_file)
+
+        # filter out folders and anything outside of /usr
+        img_files =3D [ x for x in img_content.output.splitlines() if not =
x.endswith('/') and x.startswith('./usr/') ]
+        self.logger.debug("image files:\n%s" % img_files)
+        ext_files =3D [ x for x in ext_content.output.splitlines() if not =
x.endswith('/') and x.startswith('./usr/') ]
+
+        # check mutual exclusive content listing
+        self.logger.debug("extension files:\n%s" % ext_files)
+        for i in img_files:
+            self.assertTrue(i not in ext_files, "found %s in extension" % =
i)
+        for e in ext_files:
+            self.assertTrue(e not in img_files, "found %s in base-image" %=
 e)
+
     def test_empty_image(self):
         """Test creation of image with no packages"""
         image =3D 'test-empty-image'
--=20
2.34.1


