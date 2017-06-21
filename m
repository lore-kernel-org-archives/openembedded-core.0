Return-Path: <razvan.heghedus@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 0076271ABC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 11:58:59 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v5LBtdvE004468 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 06:59:01 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2b51xq0866-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 06:59:01 -0500
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod2.natinst.com (8.16.0.17/8.16.0.17) with ESMTPS id
	v5LBx0lf028965
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 06:59:00 -0500
Received: from us-aus-exch3.ni.corp.natinst.com (130.164.68.13) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 21 Jun 2017 06:59:00 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch3.ni.corp.natinst.com (130.164.68.13) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 21 Jun 2017 06:58:59 -0500
Received: from razvanh-ro.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Wed, 21 Jun 2017 06:58:59 -0500
From: Heghedus Razvan <razvan.heghedus@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Jun 2017 15:00:02 +0300
Message-ID: <20170621120003.6440-1-razvan.heghedus@ni.com>
X-Mailer: git-send-email 2.13.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-06-21_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1703280000 definitions=main-1706210204
Subject: [PATCH 1/2] kernel: add package version in dependencies for kernel packages
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
X-List-Received-Date: Wed, 21 Jun 2017 11:59:00 -0000
Content-Type: text/plain

Make all dependencies from kernel family packages which depend
on another kernel related package to depend on the same version.
This creates a consistent state where kernel, kernel images and
kernel modules have the same version, making a kernel upgrade
leading to upgrades of the image and modules.

The upgrade works only if the KERNEL_VERSION_PKG_NAME remains
the same for the newer versions.

Signed-off-by: Heghedus Razvan <razvan.heghedus@ni.com>
---
 meta/classes/kernel-module-split.bbclass  |  7 ++++---
 meta/classes/kernel.bbclass               | 15 +++++++++------
 meta/recipes-kernel/linux/linux-yocto.inc |  4 ++++
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index 5e10dcf735..e247e66901 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -33,7 +33,7 @@ PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
 KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
 
 KERNEL_MODULE_PACKAGE_PREFIX ?= ""
-KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
+KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION_PKG_NAME}"
 KERNEL_MODULE_PROVIDE_VIRTUAL ?= "1"
 
 python split_kernel_module_packages () {
@@ -114,6 +114,7 @@ python split_kernel_module_packages () {
             for dep in vals["depends"].split(","):
                 on = legitimize_package_name(dep)
                 dependency_pkg = format % on
+                dependency_pkg += ' ${@get_full_package_version(d)}'
                 modinfo_deps.append(dependency_pkg)
         for dep in modinfo_deps:
             if not dep in rdepends:
@@ -138,10 +139,10 @@ python split_kernel_module_packages () {
     postinst = d.getVar('pkg_postinst_modules')
     postrm = d.getVar('pkg_postrm_modules')
 
-    modules = do_split_packages(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION")))
+    modules = do_split_packages(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s %s' % (d.getVar("KERNEL_VERSION_PKG_NAME"), get_full_package_version(d)))
     if modules:
         metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE')
-        d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
+        d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(['{0} {1}'.format(module, get_full_package_version(d)) for module in modules]))
 
     # If modules-load.d and modprobe.d are empty at this point, remove them to
     # avoid warnings. removedirs only raises an OSError if an empty
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 7a134d5c29..605c101e62 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -55,7 +55,7 @@ python __anonymous () {
 
         d.setVar('FILES_kernel-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}')
 
-        d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' + typelower)
+        d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' + typelower + ' ${@get_full_package_version(d)}')
 
         d.setVar('PKG_kernel-image-' + typelower, 'kernel-image-' + typelower + '-${KERNEL_VERSION_PKG_NAME}')
 
@@ -493,14 +493,17 @@ FILES_kernel-image = ""
 FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
 FILES_kernel-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
 FILES_kernel-modules = ""
-RDEPENDS_kernel = "kernel-base"
+RDEPENDS_kernel = "kernel-base ${@get_full_package_version(d)}"
 # Allow machines to override this dependency if kernel image files are
 # not wanted in images as standard
-RDEPENDS_kernel-base ?= "kernel-image"
-PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
+RDEPENDS_kernel-base ?= "kernel-image ${@get_full_package_version(d)}"
+PKG_kernel-image = "kernel-image-${KERNEL_VERSION_PKG_NAME}"
 RDEPENDS_kernel-image += "${@base_conditional('KERNEL_IMAGETYPE', 'vmlinux', 'kernel-vmlinux', '', d)}"
-PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
-RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
+PKG_kernel-base = "kernel-${KERNEL_VERSION_PKG_NAME}"
+RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION_PKG_NAME}"
+PKG_kernel-vmlinux = "kernel-vmlinux-${KERNEL_VERSION_PKG_NAME}"
+PKG_kernel-modules = "kernel-modules-${KERNEL_VERSION_PKG_NAME}"
+PKG_kernel-dev = "kernel-dev-${KERNEL_VERSION_PKG_NAME}"
 ALLOW_EMPTY_kernel = "1"
 ALLOW_EMPTY_kernel-base = "1"
 ALLOW_EMPTY_kernel-image = "1"
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 637506a2a8..c3d1284ad2 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -67,3 +67,7 @@ do_install_append(){
 addtask kernel_version_sanity_check after do_kernel_metadata do_kernel_checkout before do_compile
 addtask validate_branches before do_patch after do_kernel_checkout
 addtask kernel_configcheck after do_configure before do_compile
+
+def get_full_package_version(d):
+    return "(= " + d.getVar("PKGV") + "-" + d.getVar("PKGR") + ")"
+
-- 
2.13.1


