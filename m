Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AE7436F8A0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 17:03:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2BH3n0P003900
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Mar 2014 10:03:49 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 11 Mar 2014 10:03:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 12 Mar 2014 01:08:19 +0800
Message-ID: <74265b9e0f86a8f1714634bd8ad392133090ae3f.1394555880.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1394555880.git.liezhi.yang@windriver.com>
References: <cover.1394555880.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] classes/archive*.bbclass: remove archive-*-source.bbclass
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Mar 2014 17:03:56 -0000
Content-Type: text/plain

Nearly all of the codes in the following 3 files are the same, we can
move the code to archiver.bbclass and remove them:

  archive-configured-source.bbclass
  archive-original-source.bbclass
  archive-patched-source.bbclass

[YOCTO #5113]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/archive-configured-source.bbclass | 65 --------------------------
 meta/classes/archive-original-source.bbclass   | 65 --------------------------
 meta/classes/archive-patched-source.bbclass    | 65 --------------------------
 meta/classes/archiver.bbclass                  | 63 ++++++++++++++++++++++++-
 4 files changed, 62 insertions(+), 196 deletions(-)
 delete mode 100644 meta/classes/archive-configured-source.bbclass
 delete mode 100644 meta/classes/archive-original-source.bbclass
 delete mode 100644 meta/classes/archive-patched-source.bbclass

diff --git a/meta/classes/archive-configured-source.bbclass b/meta/classes/archive-configured-source.bbclass
deleted file mode 100644
index 961a532..0000000
--- a/meta/classes/archive-configured-source.bbclass
+++ /dev/null
@@ -1,65 +0,0 @@
-# This file is for getting archiving packages with configured
-# sources(archive ${S} after configure stage), logs(archive 'temp' after
-# package_write_rpm), dump data and creating diff file(get all
-# environment variables and functions in building and mapping all
-# content in ${S} including patches to xxx.diff.gz. All archived
-# packages will be deployed in ${DEPLOY_DIR}/sources
-
-inherit archiver
-
-# Get archiving package with configured sources including patches
-addtask do_archive_configured_sources after do_configure
-
-# Get archiving package with temp(logs) and scripts(.bb and inc files)
-addtask do_archive_scripts_logs
-
-# Get dump date and create diff file 
-addtask do_dumpdata_create_diff_gz
-
-python () {
-    pn = d.getVar('PN', True)
-    packaging = d.getVar('IMAGE_PKGTYPE', True)
-
-    if tar_filter(d):
-        return
-
-    d.appendVarFlag('do_dumpdata_create_diff_gz', 'depends', ' %s:do_package_write_' %pn + packaging)
-    build_deps = ' %s:do_dumpdata_create_diff_gz' %pn
-
-    if d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True) == 'logs_with_scripts':
-        d.appendVarFlag('do_archive_scripts_logs', 'depends', ' %s:do_package_write_' %pn + packaging)
-        build_deps += ' %s:do_archive_scripts_logs' %pn
-
-    if not not_tarball(d):
-        d.appendVarFlag('do_compile', 'depends', ' %s:do_archive_configured_sources' %pn)
-        build_deps += ' %s:do_archive_configured_sources' %pn
-
-    if bb.data.inherits_class('image', d):
-        d.appendVarFlag('do_rootfs', 'depends', build_deps)
-    else:
-        d.appendVarFlag('do_build', 'depends', build_deps)
-}
-
-ARCHIVE_SSTATE_OUTDIR = "${DEPLOY_DIR}/sources/"
-ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR = "${WORKDIR}/script-logs/"
-ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR = "${WORKDIR}/diffgz-envdata/"
-
-SSTATETASKS += "do_archive_scripts_logs"
-do_archive_scripts_logs[sstate-inputdirs] = "${ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR}"
-do_archive_scripts_logs[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
-
-python do_archive_scripts_logs_setscene () {
-    sstate_setscene(d)
-}
-
-addtask do_archive_scripts_logs_setscene
-
-SSTATETASKS += "do_dumpdata_create_diff_gz"
-do_dumpdata_create_diff_gz[sstate-inputdirs] = "${ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR}"
-do_dumpdata_create_diff_gz[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
-
-python do_dumpdata_create_diff_gz_setscene () {
-    sstate_setscene(d)
-}
-
-addtask do_dumpdata_create_diff_gz_setscene
diff --git a/meta/classes/archive-original-source.bbclass b/meta/classes/archive-original-source.bbclass
deleted file mode 100644
index e271a08..0000000
--- a/meta/classes/archive-original-source.bbclass
+++ /dev/null
@@ -1,65 +0,0 @@
-# This file is for getting archiving packages with original
-# sources(archive ${S} after unpack stage), patches, logs(archive 'temp'
-# after package_write_rpm), dump data and creating diff file(get all
-# environment variables and functions in building and mapping all
-# content in ${S} including patches to xxx.diff.gz. All archived packages
-# will be deployed in ${DEPLOY_DIR}/sources
-
-inherit archiver
-
-# Get original sources archiving package with patches
-addtask do_archive_original_sources_patches after do_unpack
-
-# Get archiving package with temp(logs) and scripts(.bb and inc files)
-addtask do_archive_scripts_logs
-
-# Get dump date and create diff file 
-addtask do_dumpdata_create_diff_gz
-
-python () {
-    pn = d.getVar('PN', True)
-    packaging = d.getVar('IMAGE_PKGTYPE', True)
-
-    if tar_filter(d):
-        return
-
-    d.appendVarFlag('do_dumpdata_create_diff_gz', 'depends', ' %s:do_package_write_' %pn + packaging)
-    build_deps = ' %s:do_dumpdata_create_diff_gz' %pn
-
-    if d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True) == 'logs_with_scripts':
-        d.appendVarFlag('do_archive_scripts_logs', 'depends', ' %s:do_package_write_' %pn + packaging)
-        build_deps += ' %s:do_archive_scripts_logs' %pn
-
-    if not not_tarball(d):
-        d.appendVarFlag('do_patch', 'depends', ' %s:do_archive_original_sources_patches' %pn)
-        build_deps += ' %s:do_archive_original_sources_patches' %pn
-
-    if bb.data.inherits_class('image', d):
-        d.appendVarFlag('do_rootfs', 'depends', build_deps)
-    else:
-        d.appendVarFlag('do_build', 'depends', build_deps)
-}
-
-ARCHIVE_SSTATE_OUTDIR = "${DEPLOY_DIR}/sources/"
-ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR = "${WORKDIR}/script-logs/"
-ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR = "${WORKDIR}/diffgz-envdata/"
-
-SSTATETASKS += "do_archive_scripts_logs"
-do_archive_scripts_logs[sstate-inputdirs] = "${ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR}"
-do_archive_scripts_logs[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
-
-python do_archive_scripts_logs_setscene () {
-    sstate_setscene(d)
-}
-
-addtask do_archive_scripts_logs_setscene
-
-SSTATETASKS += "do_dumpdata_create_diff_gz"
-do_dumpdata_create_diff_gz[sstate-inputdirs] = "${ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR}"
-do_dumpdata_create_diff_gz[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
-
-python do_dumpdata_create_diff_gz_setscene () {
-    sstate_setscene(d)
-}
-
-addtask do_dumpdata_create_diff_gz_setscene
diff --git a/meta/classes/archive-patched-source.bbclass b/meta/classes/archive-patched-source.bbclass
deleted file mode 100644
index c5f5cca..0000000
--- a/meta/classes/archive-patched-source.bbclass
+++ /dev/null
@@ -1,65 +0,0 @@
-# This file is for getting archiving packages with patched
-# sources(archive ${S} before do_patch stage), logs(archive 'temp' after
-# package_write_rpm), dump data and creating diff file(get all
-# environment variables and functions in building and mapping all
-# content in ${S} including patches to xxx.diff.gz. All archived
-# packages will be deployed in ${DEPLOY_DIR}/sources
-
-inherit archiver
-
-# Get archiving package with patched sources including patches
-addtask do_archive_patched_sources after do_patch
-
-# Get archiving package with logs(temp) and scripts(.bb and .inc files)
-addtask do_archive_scripts_logs
-
-# Get dump date and create diff file 
-addtask do_dumpdata_create_diff_gz
-
-python () {
-    pn = d.getVar('PN', True)
-    packaging = d.getVar('IMAGE_PKGTYPE', True)
-
-    if tar_filter(d):
-        return
-
-    d.appendVarFlag('do_dumpdata_create_diff_gz', 'depends', ' %s:do_package_write_' %pn + packaging)
-    build_deps = ' %s:do_dumpdata_create_diff_gz' %pn
-
-    if d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True) == 'logs_with_scripts':
-        d.appendVarFlag('do_archive_scripts_logs', 'depends', ' %s:do_package_write_' %pn + packaging)
-        build_deps += ' %s:do_archive_scripts_logs' %pn
-
-    if not not_tarball(d):
-        d.appendVarFlag('do_configure', 'depends', ' %s:do_archive_patched_sources' %pn)
-        build_deps += ' %s:do_archive_patched_sources' %pn
-
-    if bb.data.inherits_class('image', d):
-        d.appendVarFlag('do_rootfs', 'depends', build_deps)
-    else:
-        d.appendVarFlag('do_build', 'depends', build_deps)
-}
-
-ARCHIVE_SSTATE_OUTDIR = "${DEPLOY_DIR}/sources/"
-ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR = "${WORKDIR}/script-logs/"
-ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR = "${WORKDIR}/diffgz-envdata/"
-
-SSTATETASKS += "do_archive_scripts_logs"
-do_archive_scripts_logs[sstate-inputdirs] = "${ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR}"
-do_archive_scripts_logs[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
-
-python do_archive_scripts_logs_setscene () {
-    sstate_setscene(d)
-}
-
-addtask do_archive_scripts_logs_setscene
-
-SSTATETASKS += "do_dumpdata_create_diff_gz"
-do_dumpdata_create_diff_gz[sstate-inputdirs] = "${ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR}"
-do_dumpdata_create_diff_gz[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
-
-python do_dumpdata_create_diff_gz_setscene () {
-    sstate_setscene(d)
-}
-
-addtask do_dumpdata_create_diff_gz_setscene
diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 66efe7d..43373ae 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -36,6 +36,33 @@ COPYLEFT_AVAILABLE_RECIPE_TYPES = 'target native nativesdk cross crosssdk cross-
 COPYLEFT_AVAILABLE_RECIPE_TYPES[type] = 'list'
 COPYLEFT_AVAILABLE_RECIPE_TYPES[doc] = 'Space separated list of available recipe types'
 
+python () {
+    pn = d.getVar('PN', True)
+    packaging = d.getVar('IMAGE_PKGTYPE', True)
+
+    if tar_filter(d):
+        return
+
+    if d.getVar('PACKAGES', True) != '':
+        d.appendVarFlag('do_dumpdata_create_diff_gz', 'depends', ' %s:do_package_write_%s' % (pn, packaging))
+
+    build_deps = ' %s:do_dumpdata_create_diff_gz' % pn
+
+    if d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True) == 'logs_with_scripts':
+        d.appendVarFlag('do_archive_scripts_logs', 'depends', ' %s:do_package_write_%s' % (pn, packaging))
+        build_deps += ' %s:do_archive_scripts_logs' % pn
+
+    if not not_tarball(d):
+        archiver_mode = d.getVar('ARCHIVER_MODE')
+        d.appendVarFlag('do_compile', 'depends', ' %s:do_archive_%s_sources' % (pn, archiver_mode))
+        build_deps += ' %s:do_archive_%s_sources' % (pn, archiver_mode)
+
+    if bb.data.inherits_class('image', d):
+        d.appendVarFlag('do_rootfs', 'depends', build_deps)
+    else:
+        d.appendVarFlag('do_build', 'depends', build_deps)
+}
+
 def copyleft_recipe_type(d):
     for recipe_type in oe.data.typed_value('COPYLEFT_AVAILABLE_RECIPE_TYPES', d):
         if oe.utils.inherits(d, recipe_type):
@@ -516,7 +543,7 @@ def create_diff_gz(d):
 
 # This function will run when user want to get tarball for sources and
 # patches after do_unpack
-python do_archive_original_sources_patches(){
+python do_archive_original_sources(){
     archive_sources_patches(d, 'prepatch')
 }
 
@@ -567,3 +594,37 @@ python do_delete_tarlist(){
 }
 do_delete_tarlist[deptask] = "do_archive_scripts_logs"
 do_package_write_rpm[postfuncs] += "do_delete_tarlist "
+
+# Get archiving package with temp(logs) and scripts(.bb and .inc files)
+addtask do_archive_scripts_logs
+
+# Get dump date and create diff file
+addtask do_dumpdata_create_diff_gz
+
+ARCHIVE_SSTATE_OUTDIR = "${DEPLOY_DIR}/sources/"
+ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR = "${WORKDIR}/script-logs/"
+ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR = "${WORKDIR}/diffgz-envdata/"
+
+SSTATETASKS += "do_archive_scripts_logs"
+do_archive_scripts_logs[sstate-inputdirs] = "${ARCHIVE_SSTATE_SCRIPTS_LOGS_INDIR}"
+do_archive_scripts_logs[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
+
+python do_archive_scripts_logs_setscene () {
+    sstate_setscene(d)
+}
+
+addtask do_archive_scripts_logs_setscene
+
+SSTATETASKS += "do_dumpdata_create_diff_gz"
+do_dumpdata_create_diff_gz[sstate-inputdirs] = "${ARCHIVE_SSTATE_DIFFGZ_ENVDATA_INDIR}"
+do_dumpdata_create_diff_gz[sstate-outputdirs] = "${ARCHIVE_SSTATE_OUTDIR}"
+
+python do_dumpdata_create_diff_gz_setscene () {
+    sstate_setscene(d)
+}
+
+addtask do_dumpdata_create_diff_gz_setscene
+
+addtask do_archive_original_sources after do_unpack
+addtask do_archive_patched_sources after do_patch
+addtask do_archive_configured_sources after do_configure
-- 
1.8.3.1


