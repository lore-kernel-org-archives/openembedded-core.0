Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 807D174A25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 10:38:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9OAcE0c002252
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Oct 2018 03:38:14 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 24 Oct 2018 03:38:13 -0700
From: <mingli.yu@windriver.com>
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Date: Wed, 24 Oct 2018 18:38:11 +0800
Message-ID: <20181024103811.239944-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181024071813.110075-1-mingli.yu@windriver.com>
References: <20181024071813.110075-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v3] package_manager.py: correct the deploydir when packagefeed-stability inherited
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
X-List-Received-Date: Wed, 24 Oct 2018 10:38:13 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

After create_packages_dir added in below commit:
85e72e1 package_manager: Filter to only rpms we depend upon

When add below line into conf/local.conf
INHERIT += "packagefeed-stability"

There comes below error when do_rootfs
Exception: FileExistsError: [Errno 17] File exists: '/$Prj/tmp/deploy/rpm-prediff/i586/initscripts-1.0-r155.i586.rpm' -> '/$Prj/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/oe-rootfs-repo/rpm-prediff/i586/initscripts-1.0-r155.i586.rpm'

In create_packages_dir function, there is a logic
as bb.utils.remove(subrepo_dir, recurse=True) to
clean subrepo_dir which is actually as example is
/$Prj/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/oe-rootfs-repo/rpm.

But currently when inherit packagefeed-stability class,
the parameter deploydir passed to create_packages_dir is
still /$Prj/tmp/deploy/rpm as example, it should be
/$Prj/tmp/deploy/rpm-diff. Otherwise, there is a logic
os.link(l, dest) in create_packages_dir function will
result in below logic:
os.link("/$Prj/tmp/deploy/rpm-prediff/i586/initscripts-1.0-r155.i586.rpm", "/$Prj/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/oe-rootfs-repo/rpm-prediff/i586/initscripts-1.0-r155.i586.rpm")

Actually doesn't clean /$Prj/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/oe-rootfs-repo/rpm-prediff
, need to update the deploydir to make the
logic changed as below to fix the do_rootfs failure
os.link("/$Prj/tmp/deploy/rpm-prediff/i586/initscripts-1.0-r155.i586.rpm", "/$Prj/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/oe-rootfs-repo/rpm/i586/initscripts-1.0-r155.i586.rpm")

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/lib/oe/package_manager.py | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 2cc1c752b3..032d0d811b 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -733,8 +733,10 @@ class RpmPM(PackageManager):
             self.primary_arch = self.d.getVar('MACHINE_ARCH')
 
         self.rpm_repo_dir = oe.path.join(self.d.getVar('WORKDIR'), rpm_repo_workdir)
-        create_packages_dir(self.d, oe.path.join(self.rpm_repo_dir, "rpm"), d.getVar("DEPLOY_DIR_RPM"), "package_write_rpm", filterbydependencies)
-
+        deploy_prepath = d.getVar("DEPLOY_DIR_RPM")
+        if bb.data.inherits_class('packagefeed-stability', d):
+            deploy_prepath = deploy_prepath + "-prediff"
+        create_packages_dir(self.d, oe.path.join(self.rpm_repo_dir, "rpm"), deploy_prepath, "package_write_rpm", filterbydependencies)
         self.saved_packaging_data = self.d.expand('${T}/saved_packaging_data/%s' % self.task_name)
         if not os.path.exists(self.d.expand('${T}/saved_packaging_data')):
             bb.utils.mkdirhier(self.d.expand('${T}/saved_packaging_data'))
@@ -1147,9 +1149,12 @@ class OpkgPM(OpkgDpkgPM):
         self.opkg_cmd = bb.utils.which(os.getenv('PATH'), "opkg")
         self.opkg_args = "--volatile-cache -f %s -t %s -o %s " % (self.config_file, self.d.expand('${T}/ipktemp/') ,target_rootfs)
         self.opkg_args += self.d.getVar("OPKG_ARGS")
+        deploy_prepath = d.getVar("DEPLOY_DIR_IPK")
+        if bb.data.inherits_class('packagefeed-stability', d):
+            deploy_prepath = deploy_prepath + "-prediff"
 
         if prepare_index:
-            create_packages_dir(self.d, self.deploy_dir, d.getVar("DEPLOY_DIR_IPK"), "package_write_ipk", filterbydependencies)
+            create_packages_dir(self.d, self.deploy_dir, deploy_prepath, "package_write_ipk", filterbydependencies)
 
         opkg_lib_dir = self.d.getVar('OPKGLIBDIR')
         if opkg_lib_dir[0] == "/":
@@ -1526,7 +1531,10 @@ class DpkgPM(OpkgDpkgPM):
         super(DpkgPM, self).__init__(d, target_rootfs)
         self.deploy_dir = oe.path.join(self.d.getVar('WORKDIR'), deb_repo_workdir)
 
-        create_packages_dir(self.d, self.deploy_dir, d.getVar("DEPLOY_DIR_DEB"), "package_write_deb", filterbydependencies)
+        deploy_prepath = d.getVar("DEPLOY_DIR_DEB")
+        if bb.data.inherits_class('packagefeed-stability', d):
+            deploy_prepath = deploy_prepath + "-prediff"
+        create_packages_dir(self.d, self.deploy_dir, deploy_prepath, "package_write_deb", filterbydependencies)
 
         if apt_conf_dir is None:
             self.apt_conf_dir = self.d.expand("${APTCONF_TARGET}/apt")
-- 
2.18.0


