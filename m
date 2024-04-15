Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F4CC04FFF
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 06:02:15 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.58])
 by mx.groups.io with SMTP id smtpd.web10.14554.1713160930950673491
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Apr 2024 23:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=UZ8hjS2K;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.247.58, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxNkACip4W7JOCpHLmShy+j5h2dajWcfqgNqr2gRpRnnkVC0MJFjkMxfOYfZndVkZLumfdCdiwvNImeOY1yrYUntaCExrXuNvrfnhDjM98DF0DMGmsT9KxZSUjx/ZqgdIH5uVlFLfLZ+vllb0B3gK24DmNAIW4At1qESMgcFQcnT4u0pp8dlE1wMPlrTIcELK2Xf8WUV9512eFRT6VUEbqTcmz68/NcS2oZtBzClHEWuELHICDK52lFSDwS/gz6WdaQxBqOac92+rCQFbr0/RCWa2+R16hN5nTvfFmLOY3EusgJmAIkB4C1oWdKA5KHhAcBN0xtxeYz1g+AaAujJFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRItkBsFQSl4E7+3wALB3IGXKJywchs7t/WA1hOwkBM=;
 b=lbARWf1t8QHouRquNzPL4MgHgPJCiRbT0wCVYx9zC+YVJ/L+z0tOoEYHylsYm7SJUOPyA2GB3w5kTJywxmpnMeiKtffbqIvroSpVOgt1mb/7FirFFiIUyfB2uYeQee4b/d6xm4bvO0egUTGs6Ojc2ybQflqTYj6hR/8FBfpN6zt6vrtUO+N6GfZIUmIt7lDDDvlanJ8jcCIswOxS9nJbV13v6Tgo48INO4E7NHWVFV6ubquM8U9Hq0dWs1G1+7mzQdba1jN9OVQ3sBY3/id1kJ38HBPOTBrsdt/6E0QPoi9MUyV/cRzoauu8Sx8eNbJ9HasB5e9fi+Ut1m/wUJt5/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRItkBsFQSl4E7+3wALB3IGXKJywchs7t/WA1hOwkBM=;
 b=UZ8hjS2KAt1WbyWibe06o3oL1YKY1JXUnhJMrsOkrVu/+3hAQOuNccTGmWfqVfgTXVQAPrw5Wzs2Q9fITG9+9yJlgtikouanaYxnUiw0QXogiF1vETB8oMvKMsgegMA83+OSlFVS425E5WEJ6R9YpMVSC9Dy8fB5gRdTL14K0PM=
Received: from AM0PR10CA0011.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::21)
 by DBAPR06MB7013.eurprd06.prod.outlook.com (2603:10a6:10:1b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31; Mon, 15 Apr
 2024 06:02:07 +0000
Received: from AM4PEPF00025F99.EURPRD83.prod.outlook.com
 (2603:10a6:208:17c:cafe::7a) by AM0PR10CA0011.outlook.office365.com
 (2603:10a6:208:17c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.28 via Frontend
 Transport; Mon, 15 Apr 2024 06:02:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM4PEPF00025F99.mail.protection.outlook.com (10.167.16.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.0 via Frontend Transport; Mon, 15 Apr 2024 06:02:07 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 15 Apr 2024 08:02:05 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	alexandre.belloni@bootlin.com
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v6 1/3] image.bbclass/rootfs: archive and deploy package database
Date: Mon, 15 Apr 2024 08:02:01 +0200
Message-ID: <20240415060203.2961-2-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240415060203.2961-1-johannes.schneider@leica-geosystems.com>
References: <20240415060203.2961-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 15 Apr 2024 06:02:05.0886 (UTC) FILETIME=[718C9DE0:01DA8EFA]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F99:EE_|DBAPR06MB7013:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 07fb3441-7f39-4e72-82bd-08dc5d1194d2
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	N3fD1+G9SGqw16rq4K5DY4w/xlH6+hjT89OG5NuwCkYMQrnamgGq7XrkzOyxatJl6qhFDnSuKe6u1iAzwnkJN2V9sEaMu81mj/OrWATnvpElMF4vUB67FMuntaTp9H8WRaL3GC4t7y1ebqZJ8YIWexuNdG8J8uPSIRyiG8I5NVi+Dlhw3jBGA+x5PjPKAqiWUHQqz7bkTAmq8bDdVfr0ic7ckazaUXw4SaI5hs6QbjqJL1KLsZlInJ4ikCisgBAuetMRUYbgUtY44YvocOk6tHGdqzufIH/o3ggcWkZkuyXABGm5C/UgW15Ut2AEbqztARjdJ2ho+Twvts9M9+VJAj0nadbprfEiYy7BQ2L7zidCRUbmLXQbPkRDi7sdwl1QkV8CQOnYmS2sc+tiJu0JZqgZNd6T4pKkvDXFIr3QOZhcjnWDB271A7Iwp9YSfID86/kWwjXgIcolE1WeomfrAOMK0ks4nnEdFu1kr1pEHD8E2wNcTUeo71GQ/la8lbb2Gbh4qMQutxv8ijflXwzKS+7nI9HNR4tdrp9oWIalz5dH3hzgb1C5opvGtYNbzFwd73Mu3ZEd8Cg1x/QZ6vc2oh1wsSPn+oX69LNR9R/bCTBK3pQtm234ksK1emI3tn04WO5+Q42OGOvRzb8obhbPwi8sLZ+K5+gZ/C8tB+6NSzAkaxEWFDggQA2Y71Sh7NmzGJuVQO6Os/JZv+8BpHsh0Q==
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 06:02:07.2106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07fb3441-7f39-4e72-82bd-08dc5d1194d2
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F99.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB7013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 06:02:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198218

archive the package database after the rootfs has been put together as
*rootfs-pkdbfs.tar.gz, and put it into the deploy folder.

This creates a snapshot of the package mangers state at the point in
time when all dependencies have been resolved and installed; which
could be used by "extension images" to built upon.

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta/classes-recipe/image.bbclass             | 44 +++++++++++++-
 meta/classes-recipe/image_types.bbclass       |  1 +
 meta/conf/documentation.conf                  |  1 +
 meta/lib/oe/package_manager/deb/rootfs.py     |  1 +
 meta/lib/oe/package_manager/ipk/rootfs.py     |  1 +
 meta/lib/oe/package_manager/rpm/rootfs.py     |  1 +
 meta/lib/oe/rootfs.py                         | 20 +++++++
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 60 +++++++++++++++++++
 8 files changed, 128 insertions(+), 1 deletion(-)

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
index 913cb8788c..dbb39f9bd0 100644
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
index dc88c222bd..72cf177b6f 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -9,6 +9,7 @@ from oeqa.core.decorator import OETestTag
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, =
runqemu
 from oeqa.utils.sshcontrol import SSHControl
 import glob
+import oe.path
 import os
 import json
=20
@@ -17,6 +18,20 @@ class ImageFeatures(OESelftestTestCase):
     test_user =3D 'tester'
     root_user =3D 'root'
=20
+    @classmethod
+    def setUpClass(cls):
+        super().setUpClass()
+
+        # Build the tools we need and populate a sysroot
+        bitbake("dpkg-native opkg-native rpm-native python3-native")
+        bitbake("build-sysroots -c build_native_sysroot")
+
+        # Get the paths so we can point into the sysroot correctly
+        vars =3D get_bb_vars(["STAGING_DIR", "BUILD_ARCH", "bindir_native"=
, "libdir_native"])
+        cls.staging =3D oe.path.join(vars["STAGING_DIR"], vars["BUILD_ARCH=
"])
+        cls.bindir =3D oe.path.join(cls.staging, vars["bindir_native"])
+        cls.libdir =3D oe.path.join(cls.staging, vars["libdir_native"])
+
     @OETestTag("runqemu")
     def test_non_root_user_can_connect_via_ssh_without_password(self):
         """
@@ -302,6 +317,51 @@ SKIP_RECIPE[busybox] =3D "Don't build this"
             result =3D runCmd('objdump --syms %s | grep debug' % t)
             self.assertTrue("debug" in result.output, msg=3D'Failed to fin=
d debug symbol: %s' % result.output)
=20
+    def test_image_gen_pkgdbfs(self):
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
+        self.write_config(features)
+
+        bitbake(image)
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
+        # some 'add-arch' have '-' replaced by '_', some not; adding both =
does not hurt
+        cmd =3D os.path.join(self.bindir, 'opkg') + \
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
+        self.assertTrue("kernel-image" in result.output, msg=3D'Failed que=
ry installed packages')
+
+        cmd =3D os.path.join(self.bindir, 'opkg') + \
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
     def test_empty_image(self):
         """Test creation of image with no packages"""
         image =3D 'test-empty-image'
--=20
2.34.1


