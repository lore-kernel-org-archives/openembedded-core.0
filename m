Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8472C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 10:00:23 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.42])
 by mx.groups.io with SMTP id smtpd.web11.8370.1707818420839863857
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 02:00:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=snNJcLDk;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.8.42, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eN4quN3c+1t3NSoeRZZMZC5Lz6276LfRbBvI+//d5Ttq6A5msR46ki5bZlfN6JXlS8JYLek8wzDgQWTJwMEuFXmuCc0JeoCy9Wsfd+6ceejrWr7I26usQQu2cReXJ2vlNHCPMOwCw3UDrRiSP8UWFlvnupnmyZ6TE9GKhsCZNoRw7xa67to4vF0J6aCMqfRbuqN/1XyT6Grp5N2m5SCajbrxC/r9CQfHiBTiPe/fLws12S9pwWtsP8fubOlWhQ7Dq++FrftAmiYFL+sCljgTehzDN+VIEUgqJ7hpQ0iGKyApMwkJii52Bzp7ZM+0A+7ZZqlvQY12m6Y8dP5WRqZ+iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uW2R3jxnoEruyoDwElTgasnQ1V93lRe7nYGsk40sYc=;
 b=mEXJwrXxWWIRvxZunuCFTzcsYP54Ds5NbKwXSuFfwuBE3nI5ZilkP6NkZPtZ9bTJjDxBitqpDHW7Tr8HARAsvbRIe454KYZl5a7mCngukjB8aT/wT5Y1sXHz8qE3Kn+g3mZewIbx03lSV/Nhc6fc9vyEb4TunbVkirDYtLlzQys1SIceBDvd1lB+j9yeqpg0BBPkE8BLNLbDabnuQCdDFF1J2kpHwMuDlTtSVsa7aaKZ++Mm+WsUo70HGvHkmFY2MmS9Xcty/i1YgjV9CFJgBjDdqs52Z5xo5plLZvoEG9PWyf0bTYeQmGjxvIGYV+/OZSqhM803JF/MfDUTzGeSrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uW2R3jxnoEruyoDwElTgasnQ1V93lRe7nYGsk40sYc=;
 b=snNJcLDkonxmeQyUSq42zBt1g0cvnpptl4W8M/H/oWRRBjr2jVP8Gs41yyMCAIHTqhjYSrjRsZcSlaICW2P0SjxfU+NUP82GPCtMYWaDiMaIPLun5iZtAwcRy6uiR8x//Cw7PBep+P+/zXesvyfs0da2rLh2n+DBjTtOqdcEUl8=
Received: from AM6P191CA0102.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::43)
 by AS4PR06MB8542.eurprd06.prod.outlook.com (2603:10a6:20b:4e6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Tue, 13 Feb
 2024 10:00:16 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:209:8a:cafe::65) by AM6P191CA0102.outlook.office365.com
 (2603:10a6:209:8a::43) with Microsoft SMTP Server (version=TLS1_2,
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
Subject: [PATCH v2 1/3] image.bbclass/rootfs: archive and deploy opkg package database
Date: Tue, 13 Feb 2024 11:00:09 +0100
Message-ID: <20240213100012.252237-2-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213100012.252237-1-johannes.schneider@leica-geosystems.com>
References: <20240213100012.252237-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 13 Feb 2024 10:00:15.0176 (UTC) FILETIME=[7104BC80:01DA5E63]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F95:EE_|AS4PR06MB8542:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4a583500-1fc2-479c-e1ab-08dc2c7a9414
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WDR9OHxzlqZqXdK+9G1cuD6sdKMOv2MaO+U0atvbQuP7RUBehP2AM45TzvW6Va9zITOK8We0ArhzYzm6lY4LmM5Ypatktv/Wbs5XnY7MV0a5FCPp2rC/K3dpnmqbECHsj2f1goW3VMV7BFJ+X4nBcNLXZz5U4IzzSsCmRtIUKqSjePEYP1PRzXJivTxR0NqCOmkMmyJzURL+p6/ZeW4zqmPQPXgdKvdfIyWrfwlg1olqJHZ0LOhDDqrHisLPPrnUqd0f+yBRVrJKzSJpjaG5/rYjG/x9ppAWMuzUgC916LOqrBu7aC8XYXnw0+1hs/bDL3/nG45tSqeBCG/nL71Xq2p7xaAHwoc9pL4/sDF7xNpa1aZ5RZq1RrUXcr1NZiT39TmpoLUTzQlPCed6IMSNLW5DkkYFchiir5orCO3JfFK+4rpi0riEDSYXP7Sq5yQLC4btjDqz2R64Jez8tn9Cwo4OrwKUdgsWoafUubw+hnBOmCBSloAwJf1fOaxyjNZS/mbE2cfNXZzYMm6se2FnM94Wla4o2qFoVaPScTTme4BMqf/i8EKIqw/tVvNndXLblq7TAMueTm2wEB7r37wVew==
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(346002)(136003)(376002)(230922051799003)(451199024)(82310400011)(64100799003)(186009)(1800799012)(36840700001)(46966006)(40470700004)(2906002)(44832011)(36756003)(82740400003)(6666004)(478600001)(336012)(2616005)(41300700001)(83380400001)(4326008)(107886003)(5660300002)(8936002)(8676002)(26005)(316002)(70586007)(70206006)(86362001)(81166007)(1076003)(6916009)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 10:00:16.1484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a583500-1fc2-479c-e1ab-08dc2c7a9414
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR06MB8542
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 10:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195383

archive the package database after the rootfs has been put together as
*rootfs-pkdbfs.tar.gz, and put it into the deploy folder.

This creates a snapshot of the package mangers state at the point in time w=
hen
all dependencies have been resolved and installed; which can be used by "fo=
llow
up" images to be built upon.

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta/classes-recipe/image.bbclass         | 45 ++++++++++++++++++++++-
 meta/classes-recipe/image_types.bbclass   |  1 +
 meta/conf/bitbake.conf                    |  1 +
 meta/lib/oe/package_manager/deb/rootfs.py |  1 +
 meta/lib/oe/package_manager/ipk/rootfs.py |  1 +
 meta/lib/oe/package_manager/rpm/rootfs.py |  1 +
 meta/lib/oe/rootfs.py                     | 35 ++++++++++++++++++
 7 files changed, 83 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.=
bbclass
index 28be6c6362..c688c39f15 100644
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
@@ -337,6 +341,19 @@ python do_image_qa_setscene () {
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
@@ -381,6 +398,11 @@ python () {
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
@@ -393,6 +415,10 @@ python () {
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
@@ -401,6 +427,13 @@ python () {
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
@@ -419,6 +452,7 @@ python () {
=20
     maskedtypes =3D (d.getVar('IMAGE_TYPES_MASKED') or "").split()
     maskedtypes =3D [dbg + t for t in maskedtypes for dbg in ("", "debugfs=
_")]
+    maskedtypes =3D [pkgdb + t for t in maskedtypes for pkgdb in ("", "pkg=
dbfs_")]
=20
     for t in basetypes:
         vardeps =3D set()
@@ -430,6 +464,11 @@ python () {
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
@@ -468,6 +507,8 @@ python () {
             for ctype in sorted(ctypes):
                 if bt.endswith("." + ctype):
                     type =3D bt[0:-len(ctype) - 1]
+                    if type.startswith("pkgdbfs_"):
+                        type =3D type[8:]
                     if type.startswith("debugfs_"):
                         type =3D type[8:]
                     # Create input image first.
@@ -508,7 +549,7 @@ python () {
         d.setVarFlag(task, 'func', '1')
         d.setVarFlag(task, 'fakeroot', '1')
=20
-        d.appendVarFlag(task, 'prefuncs', ' ' + debug + ' set_image_size')
+        d.appendVarFlag(task, 'prefuncs', ' ' + debug + pkgdb + ' set_imag=
e_size')
         d.prependVarFlag(task, 'postfuncs', 'create_symlinks ')
         d.appendVarFlag(task, 'subimages', ' ' + ' '.join(subimages))
         d.appendVarFlag(task, 'vardeps', ' ' + ' '.join(vardeps))
diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/=
image_types.bbclass
index 3733bdfc20..03d8852aed 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -25,6 +25,7 @@ def imagetypes_getdepends(d):
=20
     fstypes =3D set((d.getVar('IMAGE_FSTYPES') or "").split())
     fstypes |=3D set((d.getVar('IMAGE_FSTYPES_DEBUGFS') or "").split())
+    fstypes |=3D set((d.getVar('IMAGE_FSTYPES_PKGDBFS') or "").split())
=20
     deprecated =3D set()
     deps =3D set()
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6f180d18b0..b03eb80c0b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -844,6 +844,7 @@ include conf/bblock.conf
 DL_DIR ?=3D "${TOPDIR}/downloads"
 SSTATE_DIR ?=3D "${TOPDIR}/sstate-cache"
 IMAGE_FSTYPES ?=3D "tar.gz"
+IMAGE_FSTYPES_PKGDBFS ?=3D "tar.gz"
 IMAGE_FSTYPES_DEBUGFS ?=3D "tar.gz"
=20
 INITRAMFS_FSTYPES ?=3D "cpio.gz"
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
index 8cd48f9450..9268a02531 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -106,6 +106,41 @@ class Rootfs(object, metaclass=3DABCMeta):
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


